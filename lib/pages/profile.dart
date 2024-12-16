import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
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
          children: [
            const SizedBox(height: 16),
            // Foto profil
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('lib/assets/images/FotoEky.png'),
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
            // Nama dan email
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
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 4),
                Icon(Icons.verified, size: 16, color: Colors.blue),
              ],
            ),
            const SizedBox(height: 16),

            // Tombol Ubah Nama dan Surel
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.person_outline, color: Colors.black),
                    label: const Text('Ubah Nama',
                        style: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.mail_outline, color: Colors.black),
                    label: const Text('Ubah Surel',
                        style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Bagian "Tentang Anda"
            _buildSectionHeader('Tentang Anda'),
            _buildListTile('Gender', 'Perempuan'),
            _buildListTile('Tanggal Lahir', '21 Maret 2004'),
            _buildListTile('Kota Tinggal', 'Surabaya'),
            _buildListTile('Pekerjaan', 'Mahasiswa'),
            _buildListTile('Institusi', 'Institut Teknologi Sepuluh Nopember'),
            _buildListTile(
              'Hobi',
              'Membaca, Traveling, Kerajinan, Musik, Film, Fotografi, '
                  'Belanja, Berkebun, Komputer & Teknologi, Memancing',
            ),

            const SizedBox(height: 24),

            // Bagian "Keamanan"
            _buildSectionHeader('Keamanan'),
            _buildListTile('Kata Sandi', 'Terakhir diubah 1 Mei 2023'),
            _buildListTile('Autentikasi', 'OTP'),
            _buildListTile('Perangkat', 'Google Chrome di Windows, Google Pixel 9XL'),

            const SizedBox(height: 24),

            // Bagian "Komunikasi"
            _buildSectionHeader('Komunikasi'),
            _buildSwitchTile(
              'Informasi umum, tips, dan pengenalan produk',
              'Kiat menggunakan BeMySample',
              true,
            ),
            _buildSwitchTile(
              'Newsletter dan promosi',
              'Jadilah yang pertama mendapatkan penawaran terbaik',
              true,
            ),
          ],
        ),
      ),
    );
  }

  // Widget header
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // Widget list tile
  Widget _buildListTile(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(subtitle),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          ),
          const Divider(),
        ],
      ),
    );
  }

  // Widget switch tile
  Widget _buildSwitchTile(String title, String subtitle, bool value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SwitchListTile(
            contentPadding: const EdgeInsets.all(0),
            value: value,
            onChanged: (val) {},
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
