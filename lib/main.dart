import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:house_jobs/screens/homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobs App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        splashFactory: NoSplash.splashFactory,
      ),
      home: const Homescreen(),
    );
  }
}
