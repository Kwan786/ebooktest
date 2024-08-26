import 'package:ebooktest/Home.dart';
import 'package:ebooktest/Drawer/Lobby.dart';
import 'package:ebooktest/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ebooktest/Drawer/Library.dart';

class Lobby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Lobby',
        style: TextStyle(
          color: Colors.white,
        ),),
        leading: Builder(builder: (context)
        {
          return IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.home,
          color: Colors.white,),
          );},),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/Home');
          },
            icon: Icon(Icons.login),
            color: Colors.white,)
        ],
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: null,
              child:
            Text('Hello!',
            style:  TextStyle(
              fontSize: 30,
            ),),),
            SizedBox(height: 25,),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.all(24.0)),
        CircleAvatar(radius: 40,
        backgroundImage: NetworkImage
          ('Photo by mohamed abdelghaffar from Pexels: https://www.pexels.com/photo/man-in-black-jacket-771742/'),
      ),
      SizedBox(height: 12,),
      ],
    ),
  Divider(),


            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: (){
                Navigator.pushNamed(context, '/Lobby');
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Library'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: (){
                Navigator.pushNamed(context, '/Library');
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box_rounded),
              title: Text('Your Book'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: (){
                Navigator.pushNamed(context, '/Book');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: (){
                Navigator.pushNamed(context, '/SettingDark');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log off'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: (){
                Navigator.pushNamed(context, '/Home');
              },
            )
          ],
        ),
      ),
    backgroundColor: Colors.black,
      );
    }

    }




