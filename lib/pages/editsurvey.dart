import 'package:flutter/material.dart';
import 'package:ngoding_project/pages/home.dart'; // Impor HomePage
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart'; // Impor package color picker
import 'package:image_picker/image_picker.dart'; // Impor package image picker
import 'dart:io'; // Impor package dart:io untuk File

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  int currentPage = 0; // Halaman aktif
  final TextEditingController _pageTitleController =
      TextEditingController(); // Controller untuk nama halaman
  List<Map<String, String>> pages = [
    {'name': 'Selamat datang!', 'description': 'Mari mengisi survei ini!'},
  ]; // Daftar halaman

  // Fungsi untuk memperbarui nama halaman di controller
  void _refreshPageNameController() {
    if (pages.isNotEmpty && currentPage < pages.length) {
      _pageTitleController.text = pages[currentPage]['name']!;
    } else {
      _pageTitleController.clear(); // Kosongkan jika tidak ada halaman
    }
  }

  int _selectedIndex = 0;
  bool _isPopupVisible = false;
  String? _selectedIsi; // Menyimpan nilai yang dipilih
  String _tombolText = ''; // Menyimpan teks tombol
  double _imageHeightFactor = 1.0; // Faktor tinggi gambar
  double _popupOffset = 1.0; // Posisi awal popup di bawah layar

  TextEditingController _backgroundColorController = TextEditingController();
  TextEditingController _buttonColorController = TextEditingController();
  TextEditingController _textColorController = TextEditingController();
  TextEditingController _buttonTextColorController = TextEditingController();
  TextEditingController _transparencyController = TextEditingController();
  TextEditingController _pageNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  Color _backgroundColor = Colors.white; // Warna latar
  Color _buttonColor = Colors.red; // Warna tombol
  Color _textColor = Colors.black; // Warna teks
  Color _buttonTextColor = Colors.white; // Warna teks tombol
  double _backgroundTransparency = 0.5; // Transparansi latar
  File? _backgroundImage; // Gambar latar

  final ImagePicker _picker = ImagePicker();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isPopupVisible = true;
      _imageHeightFactor = 0.6; // Gambar mengecil ketika popup muncul
      _popupOffset = 0.0; // Popup muncul dengan animasi slide-up
    });
  }

  void _updatePageNameController() {
    _pageNameController.text = pages[currentPage]['name'] ?? '';
    _descriptionController.text =
        pages[currentPage]['description'] ?? 'Mari mengisi survei ini!';
  }

  void _closePopup() {
    setState(() {
      _isPopupVisible = false;
      _imageHeightFactor = 1.0; // Kembali ke ukuran penuh ketika popup ditutup
      _popupOffset = 1.0; // Popup menghilang dengan animasi slide-down
    });
  }

  void _updateTombolText(String? value) {
    setState(() {
      _selectedIsi = value;
      if (value == 'Pembuka') {
        _tombolText = 'Mulai';
      } else if (value == 'Penutup') {
        _tombolText = 'Selesai';
      } else {
        _tombolText = 'Lanjut';
      }
    });
  }

  void _showColorPickerDialog(
      Color initialColor, Function(Color) onColorChanged) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Warna'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: initialColor,
              onColorChanged: onColorChanged,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Lanjutkan'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _backgroundImage = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _backgroundColorController.text =
        '#${_backgroundColor.value.toRadixString(16).substring(2).toUpperCase()}';
    _buttonColorController.text =
        '#${_buttonColor.value.toRadixString(16).substring(2).toUpperCase()}';
    _textColorController.text =
        '#${_textColor.value.toRadixString(16).substring(2).toUpperCase()}';
    _buttonTextColorController.text =
        '#${_buttonTextColor.value.toRadixString(16).substring(2).toUpperCase()}';
    _transparencyController.text = '50'; // Default transparansi 50%
    _pageNameController.text = pages[currentPage]['name'] ?? '';
    _descriptionController.text =
        pages[currentPage]['description'] ?? 'Mari mengisi survei ini!';
    _selectedIsi = 'Pembuka'; // Default pilihan isi
  }

  @override
  void dispose() {
    _transparencyController.dispose();
    _backgroundColorController.dispose();
    _buttonColorController.dispose();
    _textColorController.dispose();
    _buttonTextColorController.dispose();
    super.dispose();
  }

  Widget _buildPopupContent() {
if (_selectedIndex == 0) {
  return Stack(
    children: [
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ReorderableListView tetap scrollable
            ReorderableListView.builder(
              shrinkWrap: true, // Sesuaikan tinggi dengan konten
              physics: NeverScrollableScrollPhysics(), // Nonaktifkan scroll internal
              itemCount: pages.length,
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) newIndex -= 1;
                  final item = pages.removeAt(oldIndex);
                  pages.insert(newIndex, item);
                });
              },
              itemBuilder: (context, index) {
                return ListTile(
                  key: ValueKey(index),
                  title: Text(pages[index]['name']!),
                  subtitle: Text(pages[index]['description'] ?? ''),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        pages.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),

            // Tambahkan tombol "Tambah" di bawah daftar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    pages.add({
                      'name': 'Page ${pages.length + 1}',
                      'description': '',
                    });
                  });
                },
                icon: Icon(Icons.add),
                label: Text('Tambah'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
    } else if (_selectedIndex == 1) {
      return Column(
        children: [
          // Dropdown untuk memilih isi
          DropdownButtonFormField<String>(
            value: _selectedIsi,
            decoration: InputDecoration(
              labelText: 'Isi',
              border: OutlineInputBorder(),
            ),
            items: [
              DropdownMenuItem(
                value: 'Pembuka',
                child: Row(
                  children: [
                    Icon(Icons.rocket_launch, color: Colors.blue),
                    SizedBox(width: 8),
                    Text('Pembuka'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'Teks Pendek',
                child: Row(
                  children: [
                    Icon(Icons.short_text, color: Colors.purple),
                    SizedBox(width: 8),
                    Text('Teks Pendek'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'Teks Panjang',
                child: Row(
                  children: [
                    Icon(Icons.notes, color: Colors.purple),
                    SizedBox(width: 8),
                    Text('Teks Panjang'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'Pilihan Ganda',
                child: Row(
                  children: [
                    Icon(Icons.radio_button_checked, color: Colors.purple),
                    SizedBox(width: 8),
                    Text('Pilihan Ganda'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'Dropdown',
                child: Row(
                  children: [
                    Icon(Icons.arrow_drop_down_circle, color: Colors.purple),
                    SizedBox(width: 8),
                    Text('Dropdown'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'Waktu',
                child: Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.purple),
                    SizedBox(width: 8),
                    Text('Waktu'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'Quote',
                child: Row(
                  children: [
                    Icon(Icons.format_quote, color: Colors.purple),
                    SizedBox(width: 8),
                    Text('Quote'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'Likert',
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.purple),
                    SizedBox(width: 8),
                    Text('Likert'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 'Penutup',
                child: Row(
                  children: [
                    Icon(Icons.rocket, color: Colors.blue),
                    SizedBox(width: 8),
                    Text('Penutup'),
                  ],
                ),
              ),
            ],
            onChanged: (value) {
              _updateTombolText(value);
            },
          ),
          const SizedBox(height: 16),

          // TextField untuk nama page
          TextField(
            decoration: InputDecoration(
              labelText: 'Nama Page',
              border: OutlineInputBorder(),
            ),
            controller: _pageNameController,
            onChanged: (value) {
              setState(() {
                pages[currentPage]['name'] = value; // Update nama page
              });
            },
          ),

          const SizedBox(height: 16),

          // TextField untuk deskripsi
          TextField(
            decoration: InputDecoration(
              labelText: 'Deskripsi',
              border: OutlineInputBorder(),
            ),
            controller: _descriptionController,
            onChanged: (value) {
              setState(() {
                pages[currentPage]['description'] = value; // Update deskripsi
              });
            },
          ),

          const SizedBox(height: 16),

          // TextField untuk tombol
          TextFormField(
            key: ValueKey(_tombolText), // Memaksa rebuild jika teks berubah
            initialValue: _tombolText,
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Tombol',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: _pickImage, // Fungsi akan dipicu saat seluruh box diklik
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(8), // Membuat sudut melengkung
                border: Border.all(
                    color: Colors.grey[800]!, width: 1), // Border dark grey
                color: Colors.transparent, // Latar belakang
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 16), // Padding untuk isi dalam box
              margin: const EdgeInsets.only(
                  bottom: 8), // Memberi jarak antar elemen
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latar', // Konten teks statis
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Icon(Icons.upload, color: Colors.blue), // Ikon upload
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(8), // Membuat sudut melengkung
              border: Border.all(
                  color: const Color.fromARGB(255, 104, 104, 104)!,
                  width: 1), // Border agar serupa dengan TextField
              color: Colors.transparent, // Latar belakang
            ),
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 5), // Padding untuk isi dalam box
            margin: const EdgeInsets.only(
                bottom: 10), // Memberi jarak bawah antar elemen
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Transparansi Latar',
                  style: TextStyle(fontSize: 16),
                ),
                Slider(
                  value: _backgroundTransparency,
                  min: 0.0,
                  max: 1.0,
                  divisions: 100,
                  activeColor: const Color.fromARGB(255, 0, 18, 211)!,
                  label:
                      '${(_backgroundTransparency * 100).round()}%', // Menampilkan nilai sebagai persen
                  onChanged: (value) {
                    setState(() {
                      _backgroundTransparency =
                          value; // Memperbarui transparansi
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Warna Latar',
                    prefixIcon: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: _backgroundColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  controller: _backgroundColorController,
                ),
              ),
              IconButton(
                icon: Icon(Icons.color_lens),
                onPressed: () {
                  _showColorPickerDialog(_backgroundColor, (Color color) {
                    setState(() {
                      _backgroundColor = color;
                      _backgroundColorController.text =
                          '#${_backgroundColor.value.toRadixString(16).substring(2).toUpperCase()}';
                    });
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Warna Tombol',
                    prefixIcon: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: _buttonColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  controller: _buttonColorController,
                ),
              ),
              IconButton(
                icon: Icon(Icons.color_lens),
                onPressed: () {
                  _showColorPickerDialog(_buttonColor, (Color color) {
                    setState(() {
                      _buttonColor = color;
                      _buttonColorController.text =
                          '#${_buttonColor.value.toRadixString(16).substring(2).toUpperCase()}';
                    });
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Warna Teks',
                    prefixIcon: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: _textColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  controller: _textColorController,
                ),
              ),
              IconButton(
                icon: Icon(Icons.color_lens),
                onPressed: () {
                  _showColorPickerDialog(_textColor, (Color color) {
                    setState(() {
                      _textColor = color;
                      _textColorController.text =
                          '#${_textColor.value.toRadixString(16).substring(2).toUpperCase()}';
                    });
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Warna Teks Tombol',
                    prefixIcon: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: _buttonTextColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  controller: _buttonTextColorController,
                ),
              ),
              IconButton(
                icon: Icon(Icons.color_lens),
                onPressed: () {
                  _showColorPickerDialog(_buttonTextColor, (Color color) {
                    setState(() {
                      _buttonTextColor = color;
                      _buttonTextColorController.text =
                          '#${_buttonTextColor.value.toRadixString(16).substring(2).toUpperCase()}';
                    });
                  });
                },
              ),
            ],
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Update this to reflect the chosen color
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
        leading: IconButton(
          icon: Iconify(
            MaterialSymbols.home_outline,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {
              // Logika untuk tombol titik tiga
            },
          ),
          IconButton(
            icon: Icon(Icons.play_arrow_outlined, color: Colors.white),
            onPressed: () {
              // Logika untuk tombol play
            },
          ),
          IconButton(
            icon: Iconify(
              MaterialSymbols.upload, // Menggunakan ikon dari Iconify
              color: Colors.white, // Warna ikon
              size: 24, // Ukuran ikon
            ),
            onPressed: () {
              // Logika untuk tombol upload
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: MediaQuery.of(context).size.height * _imageHeightFactor,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: _backgroundImage != null
                  ? DecorationImage(
                      image: FileImage(_backgroundImage!),
                      fit: BoxFit.cover,
                    )
                  : DecorationImage(
                      image: AssetImage('lib/assets/images/Perkuliahan.png'),
                      fit: BoxFit.cover,
                    ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: _backgroundColor.withOpacity(_backgroundTransparency),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${pages[currentPage]['name']}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _textColor, // Warna teks dinamis
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${pages[currentPage]['description']}',
                      style: TextStyle(
                        fontSize: 16,
                        color: _textColor, // Warna teks dinamis
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Logika navigasi ke halaman survei
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _buttonColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 32.0,
                        ),
                      ),
                      child: Text(
                        'Mulai',
                        style: TextStyle(
                          color: _buttonTextColor, // Warna teks tombol dinamis
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedSlide(
            offset: Offset(0, _popupOffset),
            duration: Duration(milliseconds: 300),
            child: _isPopupVisible
                ? GestureDetector(
                    onTap: _closePopup,
                    child: Container(
                      color: Colors.transparent,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onVerticalDragUpdate: (details) {
                            if (details.primaryDelta! > 7) {
                              _closePopup();
                            }
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 3.3,
                            decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Header tetap di atas
                                Container(
                                  padding: const EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey[300]!, width: 0.5),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      _selectedIndex == 0
                                          ? 'Item'
                                          : _selectedIndex == 1
                                              ? 'Konten'
                                              : 'Desain',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                // Konten yang bisa di-scroll
                                Expanded(
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.all(16.0),
                                    child: _buildPopupContent(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.grey), // "Item" button
            label: 'Item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article, color: Colors.grey),
            label: 'Konten',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.palette, color: Colors.grey),
            label: 'Desain',
          ),
        ],
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
