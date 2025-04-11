import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoFoodHemarScreen(),
    );
  }
}

class GoFoodHemarScreen extends StatelessWidget {
  const GoFoodHemarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFFF1F1F1),
                    child: Icon(Icons.close, color: Colors.black),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.location_pin, color: Colors.red, size: 18),
                        SizedBox(width: 4),
                        Text(
                          'Dusun Curah Leduk',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/peta.png',
                      height: 50,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'GoFood HEMAT bakal hadir di areamu',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Sementara, cek menu murmer di GoFood, yuk.\nSampai ketemu pas GoFood HEMAT rilis.',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 148, 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'Ke halaman GoFood',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                Image.asset(
                  'assets/iconhemat.png',
                  height: 70,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Terhemat se-GoFood.\nHarga termasuk ongkir, tanpa syarat.',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Image.asset(
                'assets/iconbawah.png', // Ganti sesuai nama asset barunya
                height: 140, // Bisa disesuaikan (contoh: 140 atau 160)
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
