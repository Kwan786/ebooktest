import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseFirestore db = FirebaseFirestore.instance;

  /*Future<void> _userauth() async {
    // Save user data to Firestore
    await db.collection('user_auth').add({
      'Email': _emailController.text,
      'Password': _passwordController.text,
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign Up',
        style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.black,
        leading: IconButton(
        onPressed: (){
          Navigator.pushNamed(context, '/Home');
        },
        icon: Icon(Icons.arrow_back,
        color: Colors.white,),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.white,
                )),
              ),
              TextField(
                controller: _passwordController,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.white,
                )),
                obscureText: true,
              ),
              SizedBox(height: 20),
              Text(
                "By signing up, you agree to our Terms, Privacy Policy and Cookies Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(height: 50, width: 320,
              child:
              ElevatedButton(
                onPressed: () async {
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  //_userauth();

                  if (email.isEmpty || password.isEmpty) {
                    _showErrorDialog(context, 'Please fill in all fields.');
                    return;
                  }

                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    print('User signed up: ${userCredential.user}');
                    Navigator.pop(context);
                  } on FirebaseAuthException catch (e) {
                    String errorMessage;
                    if (e.code == 'weak-password') {
                      errorMessage = 'The password provided is too weak.';
                    } else if (e.code == 'email-already-in-use') {
                      errorMessage = 'The account already exists for that email.';
                    } else {
                      errorMessage = 'Sign up failed. Please try again.';
                    }
                    _showErrorDialog(context, errorMessage);
                  } catch (e) {
                    print(e);
                    _showErrorDialog(context, 'An unknown error occurred.');
                  }
                },
                child: Text('Sign Up'),
              ),),
            ],
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}