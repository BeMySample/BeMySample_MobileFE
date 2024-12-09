import 'package:flutter/material.dart';

class PreviewPage extends StatefulWidget {
  final List<Map<String, dynamic>> pages;

  PreviewPage({required this.pages});

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  int currentPage = 0;

  // Fungsi untuk mengonversi hex ke Color
  Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex'; // Tambahkan alpha jika tidak ada
    }
    return Color(int.parse(hex, radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final page = widget.pages[currentPage];

    // Properti desain
    final backgroundColor = page['backgroundColor'] != null
        ? hexToColor(page['backgroundColor'])
        : Colors.white;

    // Konversi backgroundTransparency menjadi double jika berupa string
    final backgroundTransparency = page['backgroundTransparency'] is String
        ? double.tryParse(page['backgroundTransparency']) ?? 1.0
        : (page['backgroundTransparency'] ?? 1.0);

    final buttonColor = page['buttonColor'] != null
        ? hexToColor(page['buttonColor'])
        : Colors.blue;

    final textColor = page['textColor'] != null
        ? hexToColor(page['textColor'])
        : Colors.black;

    final buttonTextColor = page['buttonTextColor'] != null
        ? hexToColor(page['buttonTextColor'])
        : Colors.white;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2073DB), Color(0xFF1F38DB)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text('Pratinjau'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Gambar latar belakang
          if (page['backgroundImage'] != null)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(page['backgroundImage']),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          // Warna latar belakang transparan
          Container(
            color: backgroundColor.withOpacity(backgroundTransparency),
          ),
          // Konten halaman
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(height: 8),
                  Text(
                    page['description'] ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      foregroundColor: buttonTextColor,
                    ),
                    child: Text('Mulai'),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_upward, size: 36, color: Colors.blue),
                        onPressed: currentPage > 0
                            ? () {
                                setState(() {
                                  currentPage--;
                                });
                              }
                            : null,
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_downward, size: 36, color: Colors.blue),
                        onPressed: currentPage < widget.pages.length - 1
                            ? () {
                                setState(() {
                                  currentPage++;
                                });
                              }
                            : null,
                      ),
                    ],
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
