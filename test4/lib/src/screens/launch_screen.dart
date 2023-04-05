import 'package:flutter/material.dart';
import 'package:test4/shared/authentication.dart';
import 'package:test4/src/screens/event_screen.dart';
import 'package:test4/src/screens/login_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    super.initState();
    Authentication auth = Authentication();
    auth.getUser().then((user) {
      MaterialPageRoute route;

      if (user != null) {
        route = MaterialPageRoute(builder: (context) => const EventScreen());
      } else {
        route = MaterialPageRoute(builder: (context) => const LoginScreen());
      }

      Navigator.pushReplacement(context, route);
    }).catchError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
