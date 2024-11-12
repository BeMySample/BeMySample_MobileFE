import 'package:flutter/material.dart';
import 'package:ngoding_project/pages/home.dart'; // Impor HomePage
import 'package:flutter_colorpicker/flutter_colorpicker.dart'; // Impor package color picker

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  int _selectedIndex = 0;
  bool _isPopupVisible = false;
  String? _selectedIsi; // Menyimpan nilai yang dipilih
  String _tombolText = ''; // Menyimpan teks tombol
  double _imageHeightFactor = 1.0; // Faktor tinggi gambar
  double _popupOffset = 1.0; // Posisi awal popup di bawah layar

  TextEditingController _backgroundColorController = TextEditingController();
  TextEditingController _buttonColorController = TextEditingController();
  TextEditingController _textColorController = TextEditingController();

  Color _backgroundColor = Colors.white; // Warna latar
  Color _buttonColor = Colors.red; // Warna tombol
  Color _textColor = Colors.black; // Warna teks

  TextEditingController _transparencyController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isPopupVisible = true;
      _imageHeightFactor = 0.6; // Gambar mengecil ketika popup muncul
      _popupOffset = 0.0; // Popup muncul dengan animasi slide-up
    });
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

  void _showColorPickerDialog(Color initialColor, Function(Color) onColorChanged) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: initialColor,
              onColorChanged: onColorChanged,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  void initState() {
    super.initState();
    _backgroundColorController.text = '#${_backgroundColor.value.toRadixString(16).substring(2).toUpperCase()}';
    _buttonColorController.text = '#${_buttonColor.value.toRadixString(16).substring(2).toUpperCase()}';
    _textColorController.text = '#${_textColor.value.toRadixString(16).substring(2).toUpperCase()}';
  }


  @override
  void dispose() {
    _transparencyController.dispose();
    _backgroundColorController.dispose();
    _buttonColorController.dispose();
    _textColorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _backgroundColor, // Update this to reflect the chosen color
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.home, color: Colors.black),
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
            icon: Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {
              // Logika untuk tombol titik tiga
            },
          ),
          IconButton(
            icon: Icon(Icons.play_arrow, color: Colors.black),
            onPressed: () {
              // Logika untuk tombol play
            },
          ),
          IconButton(
            icon: Icon(Icons.upload, color: Colors.black),
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
              image: DecorationImage(
                image: AssetImage('lib/assets/images/Perkuliahan.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: _backgroundColor.withOpacity(0.6),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Selamat datang',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Mari mengisi survei ini!',
                      style: TextStyle(fontSize: 16),
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
                      child: const Text(
                        'Mulai',
                        style: TextStyle(
                          color: Colors.white,
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
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                            ),
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Container(
                                      height: 3,
                                      width: 40,
                                      color: Colors.grey[400],
                                      margin: const EdgeInsets.only(top: 8, bottom: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      _selectedIndex == 0 ? 'Konten' : 'Desain',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  if (_selectedIndex == 0)
                                    Column(
                                      children: [
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
                                    )
                                  else
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Latar',
                                            suffixIcon: Icon(Icons.upload),
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        TextField(
                                          controller: _transparencyController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            labelText: 'Trnsprsi. Latar',
                                            suffixText: '%',
                                            border: OutlineInputBorder(),
                                          ),
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              int intValue = int.parse(value);
                                              if (intValue < 1) {
                                                _transparencyController.text = '1';
                                              } else if (intValue > 100) {
                                                _transparencyController.text = '100';
                                              }
                                              _transparencyController.selection = TextSelection.fromPosition(
                                                TextPosition(offset: _transparencyController.text.length),
                                              );
                                            }
                                          },
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
                                                    _backgroundColorController.text = '#${_backgroundColor.value.toRadixString(16).substring(2).toUpperCase()}';
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
                                                    _buttonColorController.text = '#${_buttonColor.value.toRadixString(16).substring(2).toUpperCase()}';
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
                                                    _textColorController.text = '#${_textColor.value.toRadixString(16).substring(2).toUpperCase()}';
                                                  });
                                                });
                                              },
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
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