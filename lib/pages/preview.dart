import 'package:flutter/material.dart';
import 'package:ngoding_project/pages/editsurvey.dart';
import 'dart:io';

class PreviewPage extends StatefulWidget {
  final List<Map<String, dynamic>> pages;

  const PreviewPage({super.key, required this.pages});

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  int currentPage = 0;

  // Fungsi untuk mengonversi hex ke Color
  Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final page = widget.pages[currentPage];

    // Properti desain
    final backgroundColor = page['backgroundColor'] != null
        ? hexToColor(page['backgroundColor'])
        : Colors.white;

    final backgroundTransparency = page['backgroundTransparency'] != null
        ? double.tryParse(page['backgroundTransparency']) ?? 1.0
        : 1.0;

    final backgroundImage = (page['backgroundImage'] != null &&
            File(page['backgroundImage']).existsSync())
        ? FileImage(File(page['backgroundImage']))
        : const AssetImage('lib/assets/images/Perkuliahan.png');

    final buttonColor = page['buttonColor'] != null
        ? hexToColor(page['buttonColor'])
        : Colors.red;

    final textColor = page['textColor'] != null
        ? hexToColor(page['textColor'])
        : Colors.black;

    final buttonTextColor = page['buttonTextColor'] != null
        ? hexToColor(page['buttonTextColor'])
        : Colors.white;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
            Center(
              child: Container(
                margin: const EdgeInsets.all(16.0),
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: backgroundImage as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: backgroundColor.withOpacity(backgroundTransparency),
                  ),
                ),
              ),
            ),
            // Konten Utama Halaman
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    page['name'] ?? '',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    page['description'] ?? '',
                    style: TextStyle(fontSize: 16, color: textColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      foregroundColor: buttonTextColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Mulai'),
                  ),
                ],
              ),
            ),
            // Tombol Navigasi di Kanan Bawah
    Positioned(
  bottom: 16,
  right: 16,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      if (currentPage > 0)
        Container(
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              setState(() {
                currentPage--;
              });
            },
          ),
        ),
      if (currentPage < widget.pages.length - 1)
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.white),
            onPressed: () {
              setState(() {
                currentPage++;
              });
            },
          ),
        ),
    ],
  ),
),
            // Tombol Publikasikan
            Positioned(
              top: 16,
              left: 16,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.cloud_upload_outlined, size: 18),
                label: const Text('Publikasikan'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                ),
              ),
            ),
            // Tombol X (Kembali ke EditSurvey)
            Positioned(
              top: 16,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, size: 24, color: Colors.black54),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SurveyPage()),
                  );
                },
              ),
            ),
            // Teks Bawah
            Positioned(
              bottom: 16,
              left: 16,
              child: Text(
                'Pertanyaan wajib diisi',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[700],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
