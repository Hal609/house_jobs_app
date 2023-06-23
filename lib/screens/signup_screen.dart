import 'package:flutter/material.dart';
import 'package:house_jobs/screens/homescreen.dart';

import '../reusable_widgets/reusable_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                // colors: [hexStringToColour("#7671FF"), Colors.lightBlue],
                colors: [Colors.lightGreen, Colors.lightBlue],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.05, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/alogo-2.png"),
                reusableTextField("Enter Username", Icons.person_outline_sharp,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email", Icons.email_outlined, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 10,
                ),
                reusableTextField("Reenter Password", Icons.lock, true,
                    _passwordTextController),
                const SizedBox(
                  height: 40,
                ),
                signInUp(context, false, () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container signInUp(BuildContext context, bool signIn, Function onTap) {
  return reusableButton(
    context,
    signIn ? Colors.white : Colors.black,
    signIn
        ? const Color.fromARGB(255, 217, 217, 217)
        : const Color.fromARGB(255, 92, 92, 92),
    signIn ? "Log in" : "Sign Up",
    signIn ? Colors.black : Colors.white,
    16,
    FontWeight.bold,
    Alignment.center,
    false,
    onTap,
  );
}
