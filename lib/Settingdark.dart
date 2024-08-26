import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingD extends StatelessWidget {
  const SettingD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text('Setting',
          style: TextStyle(
            color: Colors.white,
          ),),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            tileColor: Colors.black,
            leading: Icon(Icons.account_box,
            color: Colors.white,),
            title: Text('Account',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/Account');
            },
          ),
          ListTile(
            tileColor: Colors.black,
            leading: Icon(Icons.question_mark,
            color: Colors.white,),
            title: Text('About',
              style: TextStyle(
                color: Colors.white,
              ),),
            onTap: (){

            },
          ),
          Expanded(child:
          Container(
            height: 1000,
            color: Colors.black,
          ))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            DrawerHeader(child:
            Icon(Icons.favorite,
              size: 48,
              color: Colors.white,),
            ),
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
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: (){
                Navigator.pushNamed(context, '/Setting');
              },
            )
          ],
        ),
      ),
    );
  }
}
