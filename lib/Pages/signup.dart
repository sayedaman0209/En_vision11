import 'dart:async';

import 'package:envision11/Pages/animation/fade_slide.dart';
import 'package:envision11/Pages/home.dart';
import 'package:envision11/Pages/otp.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lottie/lottie.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool click = true;
  bool tap = true;
  bool otp = false;
  String? email;
  String? password;
  final TextEditingController _phone = TextEditingController();

  String? confirmPassword;

  @override
  void initState() {
    _phone.text = '+91';
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
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Scaffold(
        body: Form(
          key: key,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: FadeInSlide(
                    duration: .4,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FadeInSlide(
                  duration: .5,
                  child: Center(
                    child: ClipOval(
                      child: Lottie.asset(
                        'assets/animations/cricket.json',
                        height: 200,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FadeInSlide(
                    duration: .6,
                    child: TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      validator:
                          ValidationBuilder().email().maxLength(20).build(),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: " Enter email",
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(Icons.email_outlined),
                          prefixIconColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: "Email",
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  child: FadeInSlide(
                    duration: .7,
                    child: TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: click,
                      validator: ValidationBuilder().minLength(8).build(),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        suffixIconColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                              click ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              click = !click;
                            });
                          },
                        ),
                        hintText: " Enter password ",
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.password_rounded),
                        prefixIconColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  child: FadeInSlide(
                    duration: .8,
                    child: TextFormField(
                      onChanged: (value) {
                        confirmPassword = value;
                      },
                      obscureText: tap,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password can't be empty";
                        } else if (value.length < 8) {
                          return 'maximum value should be 8';
                        } else if (password != confirmPassword) {
                          return 'password is not matched';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          suffixIconColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: Icon(
                                tap ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                tap = !tap;
                              });
                            },
                          ),
                          hintText: " Enter password ",
                          hintStyle: const TextStyle(color: Colors.white),
                          prefixIcon: const Icon(Icons.password_rounded),
                          prefixIconColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: " Confirm Password",
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  child: FadeInSlide(
                    duration: .9,
                    child: TextFormField(
                      controller: _phone,
                      keyboardType: TextInputType.phone,
                      validator: otp
                          ? ValidationBuilder()
                              .maxLength(6)
                              .minLength(6)
                              .build()
                          : ValidationBuilder()
                              .maxLength(13)
                              .minLength(13)
                              .build(),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: otp ? 'Enter OTP' : " Enter Phone Number ",
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: FadeInSlide(
                      duration: 1.0,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              // setState(() {
                              //   otp = true;
                              //   _phonecontroller.clear();
                              // });
                              showDialog(
                                context: context,
                                builder: (context) => const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                        color: Colors.white),
                                    SizedBox(width: 10),
                                    Text(
                                      'Please wait...',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          decoration: TextDecoration.none),
                                    )
                                  ],
                                ),
                              );
                              Timer(
                                const Duration(seconds: 3),
                                () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()),
                                    (route) => false,
                                  );
                                },
                              );
                            }
                          },
                          child: const Text("Sign Up")),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Aready have account?",
                      style: TextStyle(color: Colors.white70),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OTPPage()));
                      },
                      child: const Text("Login with Otp"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
