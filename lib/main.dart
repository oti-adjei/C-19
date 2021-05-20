import 'package:covid19_dashboard/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:covid19_dashboard/screens/onboarding.dart';
import 'package:covid19_dashboard/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19 Dashboard',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: BottomNavScreen(),//BottomNavScreen(),
        routes: {
          //'/login': (context) => OnboardingScreen(),
          //'/login': (context) => LogInScreen(),
          //'/login': (context) => BottomNavScreen(),
        }
    );
  }
}
