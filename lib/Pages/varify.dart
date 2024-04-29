import 'dart:developer';

import 'package:envision11/Pages/animation/fade_slide.dart';
import 'package:envision11/Pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen(
      {super.key, required this.verification, required this.phone});
  final String verification;
  final String phone;
  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

final TextEditingController otpController = TextEditingController();

class _VerifyScreenState extends State<VerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.black,
                  Color.fromARGB(255, 183, 58, 79),
                  Colors.black
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white),
                height: MediaQuery.of(context).size.height * .75,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.black,
                              size: 35,
                            )),
                      ),
                      const FadeInSlide(
                        duration: .4,
                        child: Center(
                          child: Text(
                            'Phone Verification',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "we'have send the 6 digit code to your mobile number\n${widget.phone}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Enter Otp",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Pinput(
                          obscureText: true,
                          length: 6,
                          controller: otpController,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: ElevatedButton(
                              onPressed: () {
                                try {
                                  PhoneAuthCredential credential =
                                      PhoneAuthProvider.credential(
                                          verificationId: widget.verification,
                                          smsCode:
                                              otpController.text.toString());
                                  FirebaseAuth.instance
                                      .signInWithCredential(credential)
                                      .then((value) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const HomePage(),
                                      ),
                                    );
                                  });
                                } catch (e) {
                                  log(e.toString());
                                }
                              },
                              child: const Text("Verify")))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
