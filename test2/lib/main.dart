import 'package:flutter/material.dart';
import 'package:test2/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                color: Color(0xFF231B55),
              ),
            ),
            cardColor: const Color(0xFCF4EDDB),
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xFF202020),
              onPrimary: Color(0xFF505050),
              secondary: Color(0xFFBBBBBB),
              onSecondary: Color(0xFFEAEAEA),
              error: Color(0xFFF32424),
              onError: Color(0xFFF32424),
              background: Color.fromARGB(255, 199, 82, 82),
              onBackground: Color.fromARGB(255, 199, 82, 82),
              surface: Color(0xFF54B435),
              onSurface: Color(0xFF54B435),
            )),
        home: const HomeScreen());
  }
}
