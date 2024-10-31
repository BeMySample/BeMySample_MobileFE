import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0; // Opacity awal (0 = transparan)

  @override
  void initState() {
    super.initState();
    
    // Mulai animasi fade-in setelah layout selesai
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1.0; // Set opacity ke 1 agar muncul
      });
    });

    // Timer untuk berpindah ke halaman login setelah 3 detik
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 3), // Durasi animasi fade-in
          opacity: _opacity, // Opacity berubah dari 0 ke 1
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/BeMySamplePNG.png',
                width: 450,
                height: 450,
              ),
              SizedBox(height: 35),
              Text(
                'BeMySample: Realibility at Reach',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
