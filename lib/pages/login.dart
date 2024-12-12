import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:ngoding_project/pages/services/api_service.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLogin = true;
  bool _isVerification = false;
  final ApiService _apiService = ApiService();
  final TextEditingController _emailController = TextEditingController();

  void _toggleView() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
void dispose() {
  _emailController.dispose();
  super.dispose();
}

void _showVerificationView() {
  setState(() {
    _isVerification = true;
  });
}

bool _isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

void _sendOtp() async {
    final email = _emailController.text;

    if (email.isEmpty || !_isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Masukkan email yang valid")),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    final success = await _apiService.sendOtp(email);

    Navigator.of(context).pop();

    if (success) {
      _showVerificationView(); 
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Gagal mengirim OTP. Silakan coba lagi.")),
      );
    }
  }

  Widget _buildLoginView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Logo BeMySample
        Center(
          child: Image.asset(
            'lib/assets/images/BeMySamplePNG.png',
            width: 280,
            height: 280,
          ),
        ),
        SizedBox(height: 15),
        // Judul
        Text(
          'Selamat datang kembali!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        // Input Email
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.black54),
            filled: true,
            fillColor: Colors.white.withOpacity(0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 16),
        // Input Password
        TextField(
          obscureText: true, // Agar password tersembunyi
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: TextStyle(color: Colors.black54),
            filled: true,
            fillColor: Colors.white.withOpacity(0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 16),
        // Tombol Masuk
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Masuk',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 16),
        // Divider teks "atau"
        Center(
          child: Text('atau', style: TextStyle(color: Colors.black)),
        ),
        SizedBox(height: 16),
        // Tombol Login dengan Google
        SocialButton(
          imagePath: 'lib/assets/icons/googlelogo.png',
          text: 'Log In dengan Google',
          color: Colors.white,
          onPressed: () {
            // Aksi saat tombol ditekan
          },
        ),
        SizedBox(height: 8),
        // Teks Daftar dan Lupa Kata Sandi
        Center(
          child: RichText(
            text: TextSpan(
              text: "Belum punya akun? ",
              style: TextStyle(color: Colors.black54),
              children: [
                TextSpan(
                  text: 'Daftar gratis Sekarang',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = _toggleView,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        Center(
          child: Text(
            'Lupa kata sandi',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Logo BeMySample
        Center(
          child: Image.asset(
            'lib/assets/images/BeMySamplePNG.png',
            width: 280,
            height: 280,
          ),
        ),
        SizedBox(height: 15),
        // Judul
        Text(
          'Buat Akun Sekarang',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2),
        // Teks Masuk
        Center(
          child: RichText(
            textAlign: TextAlign.center, // Menambahkan textAlign untuk memastikan teks di tengah
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Sudah punya akun?',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 13,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: 'Masuk sekarang',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 13,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = _toggleView,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        // Input Email
        TextField(
           controller: _emailController,
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.black54),
            filled: true,
            fillColor: Colors.white.withOpacity(0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 24),
        // Input Nomor Telepon
        TextField(
          decoration: InputDecoration(
            hintText: 'Nomor Telepon',
            hintStyle: TextStyle(color: Colors.black54),
            filled: true,
            fillColor: Colors.white.withOpacity(0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 24),
        // Input Kata Sandi
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Kata sandi',
            hintStyle: TextStyle(color: Colors.black54),
            filled: true,
            fillColor: Colors.white.withOpacity(0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 24),
        // Input Ulangi Kata Sandi
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Ulangi Kata sandi',
            hintStyle: TextStyle(color: Colors.black54),
            filled: true,
            fillColor: Colors.white.withOpacity(0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(height: 24),
        // Tombol Daftar
        Opacity(
          opacity: 1,
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _sendOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Daftar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

 Widget _buildVerificationView() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      // Logo
      Center(
        child: Image.asset(
          'lib/assets/images/BeMySamplePNG.png',
          width: 280,
          height: 280,
        ),
      ),
      const SizedBox(height: 4),
      // Judul
      Text(
        'Verifikasi Akun',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 12),
      // Deskripsi
      Text(
        'Periksa surel masuk pada surel',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        'eky***@gmail.com',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 32),
      // TextBox untuk Kode OTP (6 Digit)
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          6,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0), // Sesuaikan jarak antar kotak
            child: SizedBox(
              width: 40,
              child: TextField(
                textAlign: TextAlign.center,
                maxLength: 1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  counterText: "",
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 24),
      // Tombol Lanjutkan
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Aksi tombol Lanjutkan
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text(
            'Lanjutkan',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/Background1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay Warna dengan #1F38DB dan Opacity 80%
          Container(
            color: Color(0xFF1F38DB).withOpacity(0.8),
          ),
          // Box Putih Transparan
          Center(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16),
              ),
              child: _isVerification ? _buildVerificationView() : (_isLogin ? _buildLoginView() : _buildRegisterView()),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget SocialButton
class SocialButton extends StatelessWidget {
  final String? imagePath;
  final IconData? icon;
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const SocialButton({super.key, 
    this.imagePath,
    this.icon,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: imagePath != null
            ? Image.asset(
                imagePath!,
                width: 24,
                height: 24,
              )
            : Icon(icon, color: Colors.white),
        label: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}