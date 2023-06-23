import 'package:flutter/material.dart';
import 'package:house_jobs/screens/homescreen.dart';

import '../reusable_widgets/reusable_widgets.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text("Hello"),
        backgroundColor: Colors.lightGreen,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              children: <Widget>[
                logOutButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding logOutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: reusableButton(context, Colors.black, Colors.black87, "Log out",
          Colors.white, 16, FontWeight.normal, Alignment.center, false, () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Homescreen()));
      }),
    );
  }
}
