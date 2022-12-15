import 'package:aicamzone/home.dart';
import 'package:aicamzone/landing.dart';
import 'package:aicamzone/login.dart';
import 'package:aicamzone/profil.dart';
import 'package:aicamzone/register.dart';
import 'package:aicamzone/spesifikasi.dart';
import 'package:aicamzone/startscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}