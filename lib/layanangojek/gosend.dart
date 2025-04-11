import 'package:flutter/material.dart';

class GoSendPage extends StatelessWidget {
  const GoSendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Banner
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/iklan_gosend.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // === Alamat Box seperti mengambang tapi ikut scroll ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     // Baris ambil paket
                        Row(
                          children: [
                            Image.asset('assets/icon_ambil.jpg', width: 20, height: 20),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ambil paket di",
                                    style: TextStyle(color: Colors.grey, fontSize: 13),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Babatan, GF8P+VM3, RT.010/RW.RT.001",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      const Divider(height: 20, thickness: 1),
                      Row(
                        children: [
                          Image.asset("assets/icon_kirim.jpg", width: 20, height: 20),
                          const SizedBox(width: 8),
                          const Text(
                            "Kirim paket ke mana?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Voucher
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/icon_voucher.jpg", width: 40, height: 40),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("4 voucher buat kamu",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                          SizedBox(height: 4),
                          Text("Pakai dan hemat banyak buat pengiriman.",
                              style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward, size: 16)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // GoSend Info
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "GoSend siap bantuin kamu",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset(
                            "assets/icon_paket.jpg", // ganti dengan path gambar kamu
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(width: 6),
                          const Expanded(
                            child: Text(
                              "Kirim apa aja, kapan aja pakai pengiriman fleksibel kami.",
                              style: TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            const SizedBox(height: 16),

            // Promo Cards
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                children: [
                  promoCard(
                    title: "Jaminan paket sampai 1 jam!",
                    subtitle: "Atau pengiriman berikutnya GRATIS",
                    imageAsset: 'assets/1_jam.jpg',
                  ),
                  promoCard(
                    title: "Kendaraan besar buat kiriman besar!",
                    subtitle: "Kirim sekarang pakai Instant Car dari GoSend.",
                    imageAsset: 'assets/kardus.jpg',
                  ),
                  promoCard(
                    title: "BARU! GoSend",
                    subtitle: "Lebih hemat dengan fitur terbaru",
                    imageAsset: 'assets/new_hemat.jpg',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Footer Illustration (Full height responsive)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Image.asset(
                'assets/banner_gosend.jpg',
                width: double.infinity,
                height: 250, // atau set sesuai kebutuhan, bisa pakai MediaQuery
                fit: BoxFit.cover, // menyesuaikan proporsi dan tetap penuh
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget promoCard({required String title, required String subtitle, required String imageAsset}) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 8),
          Text(subtitle,
              style: const TextStyle(color: Colors.white70, fontSize: 12)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.arrow_circle_right, color: Colors.white),
              Image.asset(imageAsset, height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
