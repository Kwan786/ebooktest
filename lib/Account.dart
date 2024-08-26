import 'package:flutter/material.dart';
import 'package:ebooktest/Home.dart';

class Account extends StatelessWidget {

  String name,email,phone;

  Account({required this.name,required this.email,required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.black,
        title: Text('Account',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        leading: Icon(Icons.account_box,
        color: Colors.white,),
        actions: [
         IconButton(onPressed: (){
           Navigator.pushNamed(context, '/Setting');
        }, icon: Icon(Icons.arrow_back),
        )
      ],
        ),
      backgroundColor: Colors.black,
      body: ListView(
        scrollDirection: Axis.vertical,
      children: [
        ListTile(
          leading: Icon(Icons.man,
          color: Colors.white,),
          title: Text('${name}',
          style: TextStyle(
            color: Colors.white,
          ),),
        ),
        ListTile(
          leading: Icon(Icons.email,
          color: Colors.white,),
          title: Text('${email}',
          style: TextStyle(
            color: Colors.white,
          ),),
        ),
        ListTile(
          leading: Icon(Icons.phone,
          color: Colors.white,),
          title: Text('${phone}',
          style: TextStyle(
            color: Colors.white,
          ),),
        )
      ],
      ),
      );
  }
}
