import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Status switch untuk bagian komunikasi
  bool _infoTipsActive = true;
  bool _newsletterActive = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

Future<void> _showEditDialog(String title, String hint, TextEditingController controller) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 22)),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.close, color: Colors.black),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Pengubahan hanya dapat dilakukan sebulan sekali.',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan logika penyimpanan jika diperlukan
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4), // Tipiskan sudut di sini
  ),
              ),
              child: const Text('Simpan',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Text(
              'Keluar',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            // Foto Profil
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        AssetImage('lib/assets/images/FotoEky.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Nama dan Email
            const Text(
              'Rezky Santika',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ekytika@gmail.com',
                  style: TextStyle(color: Color.fromARGB(255, 105, 105, 105)),
                ),
                SizedBox(width: 4),
                Icon(Icons.verified, size: 16, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 16),

            // Tombol Ubah Nama & Ubah Surel
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                     onPressed: () => _showEditDialog(
  'Ubah Nama', 'Masukkan Nama Anda', _nameController
),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.person_outline,
                          color: Colors.white),
                      label: const Text('Ubah Nama',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _showEditDialog(
  'Ubah Surel', 'Masukkan Surel Anda', _emailController
),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.mail_outline, color: Colors.white),
                      label: const Text('Ubah Surel',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Bagian Tentang Anda
            _buildSectionTitle('Tentang Anda'),
            _buildSectionBox([
              _buildIconListTile(Icons.person, 'Gender', 'Perempuan'),
              _buildIconListTile(Icons.cake, 'Tanggal Lahir', '21 Maret 2004'),
              _buildIconListTile(Icons.location_on, 'Kota Tinggal', 'Surabaya'),
              _buildIconListTile(Icons.work, 'Pekerjaan', 'Mahasiswa'),
              _buildIconListTile(Icons.school, 'Institusi',
                  'Institut Teknologi Sepuluh Nopember'),
              _buildIconListTile(Icons.sports_esports, 'Hobi',
                  'Membaca, Traveling, Kerajinan, Musik, Film, Fotografi'),
            ]),

            const SizedBox(height: 16),

            // Bagian Keamanan
            _buildSectionTitle('Keamanan'),
            _buildSectionBox([
              _buildIconListTile(Icons.lock, 'Kata Sandi',
                  'Terakhir diubah 1 Mei 2023'),
              _buildIconListTile(
                  Icons.security, 'Autentikasi', 'OTP'),
              _buildIconListTile(Icons.devices, 'Perangkat',
                  'Google Chrome di Windows\nGoogle Pixel 9XL'),
            ]),

            const SizedBox(height: 16),

            // Bagian Komunikasi
            _buildSectionTitle('Komunikasi'),
            _buildSectionBox([
              _buildSwitchTileWithIcon(
                Icons.info_outline,
                'Informasi umum, tips, dan pengenalan produk',
                'Kiat menggunakan BeMySample',
                _infoTipsActive,
                (val) {
                  setState(() {
                    _infoTipsActive = val;
                  });
                },
              ),
              _buildSwitchTileWithIcon(
                Icons.mail_outline,
                'Newsletter dan promosi',
                'Jadilah yang pertama mendapatkan penawaran terbaik',
                _newsletterActive,
                (val) {
                  setState(() {
                    _newsletterActive = val;
                  });
                },
              ),
            ]),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
  // Widget Judul Section (tengah dan biru)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Widget Section Box
  Widget _buildSectionBox(List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: children,
        ),
      ),
    );
  }

  // Widget ListTile dengan Icon
  Widget _buildIconListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }

  // Widget SwitchTile dengan Icon
  Widget _buildSwitchTileWithIcon(IconData icon, String title, String subtitle,
      bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
    );
  }
}
