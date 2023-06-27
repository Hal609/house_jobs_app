import 'package:flutter/material.dart';
import 'package:house_jobs/utils/colour_utils.dart';

import '../reusable_widgets/reusable_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/alogo-2.png"),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter Email", Icons.person_outline_sharp,
                    false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 40,
                ),
                signIn(context, () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container signIn(BuildContext context, Function onTap) {
  return reusableButton(
    context,
    Colors.white,
    const Color.fromARGB(255, 217, 217, 217),
    "Log in",
    Colors.black,
    16,
    FontWeight.bold,
    Alignment.center,
    false,
    onTap,
  );
}
