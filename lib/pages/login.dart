import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLogin = true;
  bool _isVerification = false; // Tambahkan variabel ini

  void _toggleView() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _showVerificationView() {
    setState(() {
      _isVerification = true;
    });
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
              onPressed: _showVerificationView, // Perbarui tombol "Daftar" untuk beralih ke tampilan verifikasi
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
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo
            Center(
              child: Image.network(
                "https://via.placeholder.com/184x56",
                width: 184,
                height: 56,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 40),
            // Judul
            Text(
              'Verifikasi Akun',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1F38DB),
                fontSize: 32,
                fontFamily: 'Gill Sans MT',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            // Deskripsi
            Container(
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Periksa surel masuk pada surel ',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'eky***@gmail.com',
                          style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            // Spacer
            Container(
              padding: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  const SizedBox(width: 10),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(height: 50),
            // Tombol Lanjutkan
            Opacity(
              opacity: 0.25,
              child: Container(
                width: double.infinity,
                height: 64,
                padding: const EdgeInsets.only(top: 18, bottom: 19),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Color(0xFF111111),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Lanjutkan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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