import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BeMySample'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.grey[800]),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Koin yang Dimiliki
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.attach_money, color: Colors.amber, size: 28),
                const SizedBox(width: 8),
                Text(
                  '200.000 Koin',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Section atas dengan dua tombol utama
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Colors.blue[100],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.add, color: const Color.fromARGB(255, 33, 150, 243), size: 28),
                        SizedBox(height: 8),
                        Text("Buat Sendiri", style: TextStyle(color: Colors.blue)),
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
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.star, color: Colors.white, size: 28),
                        SizedBox(height: 8),
                        Text("Buat dengan AI", style: TextStyle(color: Colors.white)),
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
            _buildSurveyCard("Preferensi Digitalisasi Pemilihan Umum", "190 responden", "38.000 dari 190.000", Colors.blue, "Dibuka"),
            const SizedBox(height: 8),
            _buildSurveyCard("Strategi Menabung Efektif bagi Sandwich Generation", "1 responden", "Terpakai 200 dari 200", Colors.red, "Terhenti"),
            const SizedBox(height: 8),
            _buildSurveyCard("Apakah Anda Siap Beralih ke Mobil Listrik?", "190 responden", "Belum Dialokasikan", Colors.grey, "Draft"),
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
                _buildContributionCard("Kamu Tim Android atau iPhone?", 200, 'lib/assets/images/AndroidVsiOs.png'),
                _buildContributionCard("Gimana Kebiasaanmu di Perkuliahan?", 200, 'lib/assets/images/Perkuliahan.png'),
                _buildContributionCard("WFH Vs WFO, Preferensimu yang Mana?", 200, 'lib/assets/images/WFHWFO.png'),
                _buildContributionCard("Mending Ikut Organisasi atau Fokus Kuliah?", 200, 'lib/assets/images/KuliahOrganisasi.png'),
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

  Widget _buildSurveyCard(String title, String responses, String status, Color color, String label) {
    return Card(
      child: ListTile(
        leading: Container(
          width: 40,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 40,
                color: color,
              ),
              const SizedBox(height: 4),
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 9, color: Colors.black54),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(responses),
            Text(status, style: TextStyle(color: Colors.red)),
          ],
        ),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }

  Widget _buildContributionCard(String title, int points, String imagePath) {
    return Card(
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 4),
            Text("Dapatkan $points", style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
