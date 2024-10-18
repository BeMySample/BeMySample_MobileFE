import 'package:flutter/material.dart';
import 'package:ngoding_project/pages/login.dart';
import 'package:ngoding_project/pages/splash.dart';
import 'package:ngoding_project/pages/home.dart'; // Import Home Page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeMySample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Awal aplikasi buka SplashScreen
      routes: {
        '/': (context) => SplashScreen(), // Route ke SplashScreen
        '/login': (context) => LoginPage(), // Route ke LoginPage
        '/home': (context) => const HomePage(), // Route ke HomePage
      },
    );
  }
}