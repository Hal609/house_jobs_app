import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:house_jobs/screens/main_screen.dart';
import 'package:house_jobs/screens/signin_screen.dart';
import 'package:house_jobs/screens/signup_screen.dart';
import '../reusable_widgets/reusable_widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _Homescreen();
}

class _Homescreen extends State<Homescreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                signInWithButton(context, false, () {}),
                signInWithButton(context, true, _handleSignIn),
                signUp(context, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                }),
                continueButton(context),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(
              color: Colors.black87,
              // fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignInScreen()));
          },
          child: const Text(
            "Log In",
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        )
      ],
    );
  }
}

Container signInWithButton(
    BuildContext context, bool isGoogle, Function onTap) {
  return reusableButton(
    context,
    isGoogle ? Colors.white : Colors.black, // Base colour
    isGoogle
        ? const Color.fromARGB(255, 217, 217, 217)
        : const Color.fromARGB(255, 92, 92, 92), // Tap colour
    isGoogle ? "Sign up with Google" : "Sign up with Apple", // Button text
    isGoogle ? Colors.black : Colors.white, // Text colour
    16, // Font size
    FontWeight.bold,
    Alignment.centerLeft,
    true, // has logo?
    onTap,
    isGoogle
        ? imageLogo("assets/images/googleLogo.png", false, Colors.white, 24)
        : imageLogo("assets/images/appleLogo.png", true, Colors.white, 24),
  );
}

Container signUp(BuildContext context, Function onTap) {
  return reusableButton(
      context,
      Colors.lightGreen,
      const Color.fromARGB(255, 92, 92, 92),
      "Sign up with email",
      Colors.white,
      16,
      FontWeight.bold,
      Alignment.centerLeft,
      true,
      onTap,
      const Icon(Icons.account_box_outlined));
}

Container continueButton(BuildContext context) {
  return reusableButton(
      context,
      Colors.white,
      const Color.fromARGB(255, 217, 217, 217),
      "Continue without logging in",
      Colors.black,
      16,
      FontWeight.bold,
      Alignment.centerLeft,
      true, () {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
        (route) => false);
  }, const Icon(Icons.amp_stories_outlined));
}
