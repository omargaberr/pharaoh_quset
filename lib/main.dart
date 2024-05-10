import 'package:flutter/material.dart';
import 'package:pharaoh_quset/screens/splash%20screen/splash_screen.dart';
// import 'package:flutter/widgets.dart';
// import 'package:pharaoh_quset/on_boarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEDF2F6),
      ),
      home: SplashScreen(),
    );
  }
}
