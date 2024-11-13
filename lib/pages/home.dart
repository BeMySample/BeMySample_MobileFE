import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/akar_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            Image.asset(
              'lib/assets/icons/BeMySampleIcon.png', // Path ke logo
              width: 32, // Sesuaikan ukuran logo
              height: 32,
            ),
            const SizedBox(width: 8),
            const Text(
              'BeMySample',
              style: TextStyle(
                color: Color.fromRGBO(30, 56, 219, 1),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Image.asset(
                'lib/assets/icons/iconscoin.png', // Path ke ikon koin
                width: 18,
                height: 18,
              ),
              const SizedBox(width: 4),
              const Text(
                '200.000',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 80, 80, 80),
                ),
              ),
              const SizedBox(width: 8), // Jarak antara koin dan ikon profil
              Padding(
                padding:
                    const EdgeInsets.only(right: 16.0), // Jarak kanan dari tepi
                child: ClipOval(
                  child: Image.asset(
                    'lib/assets/images/FotoEky.png', // Path ke foto profil
                    width: 32, // Sesuaikan ukuran ikon profil
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section atas dengan dua tombol utama
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/editsurvey');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Colors.blue[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Ubah tingkat rounded di sini
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.add,
                            color: const Color.fromARGB(255, 33, 150, 243),
                            size: 28),
                        SizedBox(height: 8),
                        Text("Buat Sendiri",
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Colors.blue[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Ubah tingkat rounded di sini
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'lib/assets/icons/staricon.png', // Path ke ikon bintang custom
                          width: 28,
                          height: 28,
                          color: Colors.white, // Sesuaikan warna ikon
                        ),
                        SizedBox(height: 8),
                        Text("Buat dengan AI",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Bagian "Survei Saya"
            Text(
              'Survei Saya',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildSurveyCard(
                "Preferensi Digitalisasi Pemilihan Umum",
                "190 responden",
                "Terpakai 38.000 dari 190.000",
                Colors.blue,
                "DIBUKA"),
            const SizedBox(height: 8),
            _buildSurveyCard(
                "Strategi Menabung Efektif bagi Sandwich Generation",
                "20 responden",
                "Terpakai 200 dari 200",
                Colors.red,
                "TERHENTI"),
            const SizedBox(height: 8),
            _buildSurveyCard("Apakah Anda Siap Beralih ke Mobil Listrik?",
                "190 responden", "Belum Teralokasikan", Colors.grey, "DRAFT"),
            const SizedBox(height: 24),

            // Bagian "Berkontribusi"
            Text(
              'Berkontribusi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildContributionCard("Kamu Tim Android atau iPhone?", 200,
                    'lib/assets/images/AndroidVsiOs.png'),
                _buildContributionCard("Gimana Kebiasaanmu di Perkuliahan?",
                    200, 'lib/assets/images/Perkuliahan.png'),
                _buildContributionCard("WFH Vs WFO, Preferensimu yang Mana?",
                    200, 'lib/assets/images/WFHWFO.png'),
                _buildContributionCard(
                    "Mending Ikut Organisasi atau Fokus Kuliah?",
                    200,
                    'lib/assets/images/KuliahOrganisasi.png'),
              ],
            ),
            const SizedBox(height: 16),

            // Tombol "Eksplor Lebih Banyak Survei"
            Card(
              color: Colors.grey[200],
              child: ListTile(
                title: Text(
                  'Eksplor lebih banyak survei ...',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Aksi saat tombol diklik, bisa navigasi ke halaman survei lainnya
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSurveyCard(String title, String responses, String status,
      Color color, String label) {
    return Card(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 148,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    label,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Iconify(
                            MaterialSymbols.person,
                            size: 16,
                            color: Color(0xFF5A5A5A),
                          ),
                          const SizedBox(width: 4),
                          Text(responses,
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Iconify(
                            Mdi.clock_time_four,
                            size: 16,
                            color: Color(0xFF5A5A5A),
                          ),
                          const SizedBox(width: 4),
                          Text("Diperbarui 10 Oktober 2024",
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset(
                            'lib/assets/icons/iconscoin.png', // Path ke ikon yang diinginkan
                            width: 12,
                            height: 12,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(status,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildContributionCard(String title, int points, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 163,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                imagePath,
                height:
                    100, // Sesuaikan tinggi gambar agar memenuhi bagian atas card
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: null, // Tidak ada batas maksimal baris
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Image.asset(
                        'lib/assets/icons/iconscoin.png', // Path ke ikon koin
                        width: 12,
                        height: 12,
                        color: Colors.blue, // Sesuaikan warna ikon
                      ),
                      const SizedBox(width: 4),
                      Text("Dapatkan $points",
                          style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
