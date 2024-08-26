import 'package:ebooktest/Home.dart';
import 'package:ebooktest/Drawer/Lobby.dart';
import 'package:ebooktest/SignUpPage.dart';
import 'package:flutter/material.dart';
import 'package:ebooktest/Settingdark.dart';
import 'package:ebooktest/LobbyDark.dart';
import 'package:ebooktest/Account.dart';
import 'package:ebooktest/Drawer/Library.dart';
import 'package:ebooktest/Drawer/Your Book.dart';
import 'package:ebooktest/SignUpPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login System",
      debugShowCheckedModeBanner: false,
      home: const Home(),
      routes: {
        '/Lobby': (context) => Lobby(),
        '/SettingDark': (context) => SettingD(),
        '/Home': (context) => Home(),
        '/LobbyDark': (context) => LobbyD(),
        '/Account': (context) => Account(
              name: '',
              email: '',
              phone: '',
            ),
        '/Library': (context) => Library(),
        '/SignUpPage': (context) => SignUpPage(),
        '/Book': (context) => Your_Book(),
      },
    );
  }
}
