import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_signin/firebase_options.dart';
import 'package:google_signin/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initailize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Google Sign In",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: const HomePage(),
    );
  }
}
