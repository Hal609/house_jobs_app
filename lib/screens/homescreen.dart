import 'package:flutter/material.dart';
import 'package:house_jobs/screens/main_screen.dart';
import 'package:house_jobs/screens/signin_screen.dart';
import 'package:house_jobs/screens/signup_screen.dart';
import 'package:house_jobs/services/auth_service.dart';
import '../reusable_widgets/reusable_widgets.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _Homescreen();
}

// const FlutterSecureStorage _storage = FlutterSecureStorage();

// final GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: [
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

class _Homescreen extends State<Homescreen> {
  // String userName = '';
  // String userImage = '';
  // String userID = '';
  // String userEmail = '';
  // String userServerAuthCode = '';

  // GoogleSignInAccount? _currentUser;

  @override
  // void initState() {
  //   super.initState();
  //   _loadUserData();
  //   _checkLoggedIn();
  //   _googleSignIn.onCurrentUserChanged
  //       .listen((GoogleSignInAccount? account) async {
  //     setState(() {
  //       _currentUser = account;
  //     });
  //   });
  //   _googleSignIn.signInSilently();
  // }

  // Future<void> _checkLoggedIn() async {
  //   final bool isLoggedIn = await _storage.read(key: 'isLoggedIn') == 'true';
  //   if (isLoggedIn) {
  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) => const MainScreen()),
  //       (route) => false,
  //     );
  //   }
  // }

  // Future<void> _loadUserData() async {
  //   final bool isLoggedIn = await _storage.read(key: 'isLoggedIn') == 'true';
  //   if (isLoggedIn) {
  //     setState(() async {
  //       userID = await _storage.read(key: 'id') ?? '';
  //       userName = await _storage.read(key: 'displayName') ?? '';
  //       userEmail = await _storage.read(key: 'email') ?? '';
  //       userImage = await _storage.read(key: 'photoUrl') ?? '';
  //       userServerAuthCode = await _storage.read(key: 'serverAuthCode') ?? '';
  //     });
  //   }
  // }

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
                // accountLogo(_currentUser),
                logoWidget("assets/images/alogo-2.png"),
                signInWithButton(context, false, () {}),
                signInWithButton(
                    context, true, () => AuthService().signInWithGoogle()),
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

  // Future<void> _handleSignIn() async {
  //   try {
  //     final GoogleSignInAccount? account = await _googleSignIn.signIn();
  //     if (account != null) {
  //       // Save the user information in secure storage
  //       await _storage.write(key: 'isLoggedIn', value: 'true');
  //       await _storage.write(key: 'id', value: account.id);
  //       await _storage.write(key: 'displayName', value: account.displayName);
  //       await _storage.write(key: 'email', value: account.email);
  //       await _storage.write(key: 'photoUrl', value: account.photoUrl ?? '');
  //       await _storage.write(
  //           key: 'serverAuthCode', value: account.serverAuthCode ?? '');

  //       // Navigate to the MainScreen
  //       Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (context) => const MainScreen()),
  //         (route) => false,
  //       );
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
            },
            child: const Row(children: <Widget>[
              Text(
                "Already have an account?",
                style: TextStyle(
                    color: Colors.black87,
                    // fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Log In",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ]))
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
    isGoogle ? "Sign in with Google" : "Sign in with Apple", // Button text
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
