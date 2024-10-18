import 'package:flutter/material.dart';
import 'package:ngoding_project/pages/login.dart';
import 'package:ngoding_project/pages/splash.dart';
import 'package:ngoding_project/pages/home.dart'; // Import Home Page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'My Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(), // Route ke Login Page
        '/home': (context) => HomePage(), // Route ke Home Page
      },
    );
  }
}