import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test4/firebase_options.dart';
import 'package:test4/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(theme: ThemeData.light(), home: const App()));
}
