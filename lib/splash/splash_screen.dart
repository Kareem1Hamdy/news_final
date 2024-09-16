import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            Image.asset('assets/images/splash.png'),
            AnimatedSplashScreen(
              nextScreen: HomeScreen(),
              splash: const Text(''),
              backgroundColor: Colors.transparent,
            )
          ],
        ),
      );
  }
}
