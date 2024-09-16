import 'package:flutter/material.dart';
import 'package:news_app/colors/colors.dart';
import 'package:news_app/provider/App_Provider.dart';
import 'package:news_app/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            )
          )
        )
      ),
    );
  }
}