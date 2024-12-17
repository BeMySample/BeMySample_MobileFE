import 'package:flutter/material.dart';
import 'package:ngoding_project/pages/login.dart';
import 'package:ngoding_project/pages/splash.dart';
import 'package:ngoding_project/pages/home.dart';
import 'package:ngoding_project/pages/editsurvey.dart';
import 'package:ngoding_project/pages/preview.dart';
import 'package:ngoding_project/pages/verification.dart';
import 'package:ngoding_project/pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'BeMySample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', 
      routes: {
        '/': (context) => SplashScreen(), // Route ke SplashScreen
        '/login': (context) => LoginPage(), // Route ke LoginPage
        '/home': (context) => const HomePage(), // Route ke HomePage
        '/editsurvey': (context) => SurveyPage(), // Route ke SurveyPage
        '/preview': (context) => PreviewPage(pages: []), // Route ke PreviewPage
         '/verification': (context) => VerificationPage(), // Route ke VerificationPage
         '/profile': (context) => ProfilePage(), // Route ke ProfilePage
      },
      builder: (context, child) {
        // Override text scale to 1.0
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }
}
