import 'package:ebooktest/Drawer/Lobby.dart';
import 'package:flutter/material.dart';
import 'package:ebooktest/Account.dart';
import 'package:ebooktest/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:ebooktest/Home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

    void _showErrorDialog(BuildContext context, String message) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error',),
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
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("E-book",
          style: TextStyle(
            color: Colors.white,
          ),),
          backgroundColor: Colors.black,),
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
      decoration: InputDecoration(labelText: 'Enter Email',
      labelStyle: TextStyle(
      color: Colors.white,
      )),
      ),
      TextField(
      controller: _passwordController,
      style: TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(labelText: 'Enter Password',
      labelStyle: TextStyle(
      color: Colors.white,
      )),
      obscureText: true,
      ),
            SizedBox(child: Padding(padding: EdgeInsets.only(left: 150.0),
            child: TextButton(onPressed: (){
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => ForgotPassword()));
            }, child: Text('Forgot your password?',
            style: TextStyle(
              color: Colors.white,
            ),)),),),
             SizedBox(height: 50,width: 320,
            child: ElevatedButton(
            onPressed: () async {
      String email = _emailController.text;
      String password = _passwordController.text;

      if (email.isEmpty || password.isEmpty) {
      _showErrorDialog(context, 'Please fill in all fields.');
      return;
      }

      try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
      email: email,
      password: password,
      );
      print('User logged in: ${userCredential.user}');
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Lobby()),
      );
      } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
      errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
      errorMessage = 'Wrong password provided.';
      } else {
      errorMessage = 'Login failed. Please try again.';
      }
      _showErrorDialog(context, errorMessage);
      } catch (e) {
      print(e);
      _showErrorDialog(context, 'An unknown error occurred.');
      }
      },
      child: Text('Login',
      style: TextStyle(
        color: Colors.black,
      ),),
      ),),

            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
              },
              child: Text("Don't have an account? Sign up",
              style: TextStyle(
                color: Colors.white,
              ),),
            ),
          ],
        ),
      )));
    }
  }
  
  class ForgotPassword extends StatefulWidget {
    const ForgotPassword({super.key});

    @override
    State<ForgotPassword> createState() => _ForgotPasswordState();
  }

  class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Reset Password',
              style: TextStyle(
                color: Colors.white,
              ),),
            leading: IconButton(onPressed: (){
              Navigator.pushNamed(context, '/Home');
            }, icon: Icon(Icons.arrow_back,
              color: Colors.white,))
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please Type in your email to reset password.',
                style: TextStyle(
                  color: Colors.white,
                ),),
              Padding(padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(labelText: 'Enter Email',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  )),
                ),)
            ],
          ),
        ),
      );
    }
  }
  

  
