import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_jobs/screens/homescreen.dart';
import '../reusable_widgets/reusable_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmTextController = TextEditingController();
  bool passwordsMatch = true;

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
                    false, _usernameTextController, () {}),
                const SizedBox(
                  height: 10,
                ),
                reusableTextField("Enter Email", Icons.email_outlined, false,
                    _emailTextController, () {}),
                const SizedBox(
                  height: 5,
                ),
                _buildPasswordMismatchWidget(),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController, () {
                  if (_confirmTextController.text != "") {
                    setState(() {
                      passwordsMatch = _passwordTextController.text ==
                          _confirmTextController.text;
                    });
                  }
                }),
                const SizedBox(
                  height: 10,
                ),
                reusableTextField("Reenter Password", Icons.lock, true,
                    _confirmTextController, () {
                  setState(() {
                    passwordsMatch = _passwordTextController.text ==
                        _confirmTextController.text;
                  });
                }),
                const SizedBox(
                  height: 40,
                ),
                signInUp(context, false, checkPasswordMatch),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkPasswordMatch() {
    if (_passwordTextController.text == _confirmTextController.text) {
      // Passwords match
      print("Match");
    } else {
      // Passwords don't match, show an error message or perform desired action
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text("Error"),
            content: const Text("Passwords do not match."),
            actions: <Widget>[
              CupertinoDialogAction(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Widget _buildPasswordMismatchWidget() {
    if (!passwordsMatch) {
      return Row(
        children: const <Widget>[
          Icon(
            Icons.error_outline_sharp,
            color: Colors.red,
          ),
          SizedBox(width: 3),
          Text(
            'Passwords do not match',
            style: TextStyle(color: Colors.red),
          ),
        ],
      );
    } else {
      return const SizedBox(height: 5);
    }
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
