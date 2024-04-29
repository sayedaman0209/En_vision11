import 'package:envision11/Pages/animation/fade_slide.dart';
import 'package:envision11/Pages/home.dart';
import 'package:envision11/Pages/otp.dart';
import 'package:envision11/Pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  bool click = true;
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
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: FadeInSlide(
                    duration: .4,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                FadeInSlide(
                  duration: .5,
                  child: Center(
                      child: ClipOval(
                    child: Lottie.asset(
                      'assets/animation/cricket logo.json',
                      height: 200,
                    ),
                  )),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: FadeInSlide(
                    duration: .6,
                    child: TextFormField(
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
                      obscureText: click,
                      validator: ValidationBuilder().minLength(8).build(),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          suffixIconColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: Icon(click
                                ? Icons.visibility_off
                                : Icons.visibility),
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
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
                FadeInSlide(
                  duration: .8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OTPPage()));
                          },
                          child: const Text(
                            "Login with OTP ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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
                      duration: .9,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ));
                            }
                          },
                          child: const Text("Login")),
                    ),
                  ),
                ),
                FadeInSlide(
                  duration: 1.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have account?",
                        style: TextStyle(color: Colors.white70),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                          child: const Text("Sign up"))
                    ],
                  ),
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
