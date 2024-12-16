import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _pages = [
    _PageOne(),
    _PageTwo(),
    _PageThree(),
    _PageFour(),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header image (tetap)
          if (_currentPage < _pages.length - 1)
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/icons/BeMySampleHeader.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Judul dan deskripsi (tetap di semua halaman)
          if (_currentPage < _pages.length - 1)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selangkah lagi!',
                  style: TextStyle(
                    color: Color(0xFF1F38DB),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Isi seluruh data diri berikut untuk melanjutkan. ',
                        style: TextStyle(color: Color(0xFF757575), fontSize: 14),
                      ),
                      TextSpan(
                        text: 'Mengapa data ini dibutuhkan?',
                        style: TextStyle(color: Color(0xFF2073DB), fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: _pages,
                ),
                // Navigation and page indicator
         Positioned(
  bottom: 32,
  left: 16,
  right: 16,
  child: _currentPage < _pages.length - 1 // Sembunyikan navigasi di halaman terakhir
      ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: _currentPage > 0 ? _previousPage : null,
              child: Iconify(
                Ic.outline_arrow_back_ios,
                size: 24,
                color: _currentPage > 0 ? Color(0xFF1F38DB) : Colors.grey,
              ),
            ),
            Text(
              '${_currentPage + 1} dari ${_pages.length - 1}', // Indikator halaman
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            GestureDetector(
              onTap: _nextPage,
              child: Iconify(
                Ic.outline_arrow_forward_ios,
                size: 24,
                color: Color(0xFF1F38DB),
              ),
            ),
          ],
        )
      : SizedBox.shrink(), // Hilangkan navigasi di halaman terakhir
),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<_PageOne> {
  String? selectedGender; // Variable to track selected gender

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'Nama Lengkap',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan nama lengkap',
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Gender',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Pria';
                    });
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedGender == 'Pria'
                          ? Color(0xFF1F38DB)
                          : Colors.white,
                      border: Border.all(
                        color: selectedGender == 'Pria'
                            ? Color(0xFF1F38DB)
                            : Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Pria',
                      style: TextStyle(
                        color: selectedGender == 'Pria'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Wanita';
                    });
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selectedGender == 'Wanita'
                          ? Color(0xFF1F38DB)
                          : Colors.white,
                      border: Border.all(
                        color: selectedGender == 'Wanita'
                            ? Color(0xFF1F38DB)
                            : Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'Wanita',
                      style: TextStyle(
                        color: selectedGender == 'Wanita'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Tanggal Lahir',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan tanggal lahir',
            ),
          ),
        ],
      ),
    );
  }
}

class _PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'Kota Tinggal',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan kota tinggal',
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Pekerjaan',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan pekerjaan',
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Institusi',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Masukkan institusi',
            ),
          ),
        ],
      ),
    );
  }
}

class _PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<_PageThree> {
  // Daftar hobi
  final List<Map<String, dynamic>> hobbies = [
    {"name": "Memasak", "icon": Icons.home},
    {"name": "Membaca", "icon": Icons.book},
    {"name": "Traveling", "icon": Icons.flight},
    {"name": "Belanja", "icon": Icons.shopping_cart},
    {"name": "Bersosial", "icon": Icons.chat},
    {"name": "Kerajinan", "icon": Icons.cut},
    {"name": "Permainan Video", "icon": Icons.videogame_asset},
    {"name": "Permainan Papan & Kartu", "icon": Icons.table_chart},
    {"name": "Menggambar & Melukis", "icon": Icons.brush},
    {"name": "Berkebun", "icon": Icons.grass},
    {"name": "Olahraga & Fitness", "icon": Icons.fitness_center},
    {"name": "Otomotif", "icon": Icons.directions_car},
    {"name": "Komputer & Teknologi", "icon": Icons.computer},
    {"name": "Fotografi", "icon": Icons.camera_alt},
    {"name": "Musik", "icon": Icons.music_note},
    {"name": "Film", "icon": Icons.movie},
    {"name": "Karya Seni", "icon": Icons.palette},
  ];

  // Set untuk menyimpan hobi yang dipilih
  Set<String> selectedHobbies = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
      Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(
      'Hobi',
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
      'Pilih satu atau lebih',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
    ),
  ],
),
const SizedBox(height: 1),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 72),
              child: ListView.builder(
                itemCount: hobbies.length,
                itemBuilder: (context, index) {
                  final hobby = hobbies[index];
                  final isSelected = selectedHobbies.contains(hobby['name']);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedHobbies.remove(hobby['name']);
                        } else {
                          selectedHobbies.add(hobby['name']);
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Color(0xFF1F38DB)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isSelected
                              ? Color(0xFF1F38DB)
                              : Colors.grey.shade400,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Nama hobi di sebelah kiri
                          Text(
                            hobby['name'],
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // Ikon di sebelah kanan pojok
                          Icon(
                            hobby['icon'],
                            color: isSelected
                                ? Colors.white
                                : Colors.grey[600],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header image
        Expanded(
          child: Container(
        width: double.infinity,
  height: MediaQuery.of(context).size.height * 0.6, // Tinggi gambar (60% layar)
  child: Transform.scale(
    scale: 1.2, // Nilai skala untuk zoom gambar
    child: Image.asset(
      'lib/assets/images/BeMySampleGirl.png', // Path gambar
      fit: BoxFit.cover, // Tetap cover untuk menjaga proporsi
    ),
  ),   
          ),
        ),
        // Kontainer putih untuk teks
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          padding: const EdgeInsets.all(24.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Selamat datang!',
                style: TextStyle(
                  color: Color(0xFF1F38DB),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Perjalanan penelitian menuju\nkeberhasilan dimulai dari sini.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              // Tombol Masuk Sekarang
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi ketika tombol ditekan
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1F38DB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Masuk Sekarang',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

