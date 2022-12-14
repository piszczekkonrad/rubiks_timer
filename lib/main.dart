import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rubiks_timer/Home%20Page/home_page.dart';
import 'package:rubiks_timer/firebase_options.dart';
import 'package:rubiks_timer/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rubik's Cube Timer",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
