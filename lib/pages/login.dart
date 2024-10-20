import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo BeMySample
                  Center(
                    child: Image.asset(
                      'lib/assets/images/BeMySamplePNG.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 10),
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
                            ),
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
              ),
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

  const SocialButton({
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
