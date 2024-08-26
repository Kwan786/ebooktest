import 'package:flutter/material.dart';

class LobbyD extends StatefulWidget {
  const LobbyD({super.key});

  @override
  State<LobbyD> createState() => _LobbyDState();
}

class _LobbyDState extends State<LobbyD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text('Lobby',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/Home');
          },
            icon: Icon(Icons.login),
            color: Colors.white,)
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child:Column(
          children: [
            DrawerHeader(child: Icon(
              Icons.favorite,
              size: 48,
              color: Colors.white,
            )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: (){
                Navigator.pushNamed(context, '/LobbyDark');
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
            )
          ],
        ),
      ),
    );
  }
}


