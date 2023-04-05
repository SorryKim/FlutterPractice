import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test4/src/screens/launch_screen.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Events',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const LaunchScreen(),
    );
  }
}
