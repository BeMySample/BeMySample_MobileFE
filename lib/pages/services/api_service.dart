import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://localhost:5000"; // Ganti dengan URL backend Anda

  Future<bool> sendOtp(String email) async {
    final url = Uri.parse("$baseUrl/send-otp");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email, // Parameter yang sesuai dengan backend
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print("Failed to send OTP: ${response.body}");
      return false;
    }
  }
}
