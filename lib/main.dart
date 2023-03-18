
import 'package:flutter/material.dart';
import 'query/name.dart';
import 'Login/SplashScreen.dart';
import 'Login/OTPpage.dart';
import 'query/insert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Edit/profile.dart';
import 'query/OTPpage.dart';
import 'query/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'My App',
    home: MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
          .copyWith(textScaleFactor: 1.0),
      child: FirstPage(),
    ),
  ));
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(),
    );
  }
}




