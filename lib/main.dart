import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laboratorio_virtual/screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: "Login",
      home: AnimatedSplashScreen(
        splash: const Icon(
          Icons.science,
          color: Colors.blue,
          size: 150,
        ),
        splashTransition: SplashTransition.fadeTransition,
        duration: 1500,
        nextScreen: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
