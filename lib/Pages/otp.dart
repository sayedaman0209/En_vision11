import 'dart:developer';

import 'package:envision11/Pages/animation/fade_slide.dart';
import 'package:envision11/Pages/varify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

GlobalKey<FormState> key = GlobalKey<FormState>();
final TextEditingController _phone = TextEditingController();

class _OTPPageState extends State<OTPPage> {
  @override
  void initState() {
    _phone.text = '+91';
    super.initState();
  }

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
                      const Text(
                        'Enter your phone number in order to get started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black54),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 10),
                        child: FadeInSlide(
                          duration: .9,
                          child: Form(
                            key: key,
                            child: TextFormField(
                              controller: _phone,
                              keyboardType: TextInputType.phone,
                              validator: ValidationBuilder()
                                  .maxLength(13)
                                  .minLength(13)
                                  .build(),
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  labelText: " Enter Phone Number ",
                                  labelStyle:
                                      const TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: ElevatedButton(
                              onPressed: () async {
                                if (key.currentState!.validate()) {
                                  try {
                                    await FirebaseAuth.instance
                                        .verifyPhoneNumber(
                                            phoneNumber: _phone.text,
                                            verificationCompleted:
                                                (PhoneAuthCredential
                                                    credential) {},
                                            verificationFailed:
                                                (FirebaseAuthException e) {
                                              log('Verification failed: $e');
                                            },
                                            codeSent: (String verificationId,
                                                int? resendToken) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          VerifyScreen(
                                                              verification:
                                                                  verificationId,
                                                              phone: _phone.text
                                                                  .toString())));
                                            },
                                            codeAutoRetrievalTimeout:
                                                (String verificationId) {});
                                  } catch (e) {
                                    log(e.toString());
                                  }
                                }
                              },
                              child: const Text("Send Otp")))
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
