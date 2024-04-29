import 'dart:async';

import 'package:envision11/Pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SignUpPage()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.black,
          Color.fromARGB(255, 183, 58, 79),
          Colors.black
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipOval(
                child: LottieBuilder.asset(
                  'assets/animations/cricket.json',
                  height: 300,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Vision Of Your Dream',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
