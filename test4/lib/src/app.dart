import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test4/src/pages/home.dart';
import 'package:test4/src/pages/login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (_, AsyncSnapshot<User?> user) {
          if (user.hasData) {
            return const Home();
          } else {
            return const Login();
          }
          return Container();
        });
  }
}
