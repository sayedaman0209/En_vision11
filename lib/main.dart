// import 'package:envision11/Pages/api.dart';
// import 'package:envision11/Pages/home.dart';
// import 'package:envision11/Pages/login.dart';
// import 'package:envision11/Pages/otp.dart';
// import 'package:envision11/Pages/signup.dart';
import 'package:envision11/Pages/api.dart';
import 'package:envision11/Pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await cricketMatches();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Splashscreen());
  }
}
