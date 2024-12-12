import 'package:flutter/material.dart';

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
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: _previousPage,
                      ),
                      Text('${_currentPage + 1} dari ${_pages.length}'),
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        onPressed: _nextPage,
                      ),
                    ],
                  ),
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

class _PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Halaman 3'),
    );
  }
}
