import 'package:api_test/screens/home_screen.dart';
import 'package:api_test/services/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  ApiService().getMountain();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }
}
