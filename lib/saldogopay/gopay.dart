import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GopayScreen(),
    );
  }
}

class GopayScreen extends StatelessWidget {
  const GopayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Riwayat transaksi",
            style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          // Filter Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterButton("Tanggal"),
                _buildFilterButton("Layanan"),
                _buildFilterButton("Metode"),
              ],
            ),
          ),
          // Banner
          const GopayBanner(), // Ini bagian banner
          // Transaction List
          Expanded(
            child: ListView(
              children: [
                _buildDateHeader("Sabtu, 22 Feb 2025"),
                _buildTransactionItem(
                  icon: Icons.restaurant,
                  title: "Mie Gacoan, Sidoarjo Ponti",
                  subtitle: "Jl. Ponti Raya No. 9, Sid...",
                  amount: "-Rp930",
                  isIncome: false,
                ),
                _buildDateHeader("Kamis, 24 Okt 2024"),
                _buildTransactionItem(
                  icon: Icons.wifi,
                  title: "AXISNET",
                  subtitle: "",
                  amount: "-Rp3.350",
                  isIncome: false,
                ),
                _buildDateHeader("Senin, 09 Sep 2024"),
                _buildTransactionItem(
                  icon: Icons.restaurant,
                  title: "Nasi Goreng TOP, Pujasera Kalimantan",
                  subtitle: "Krajan Timur, Sumbersar...",
                  amount: "-Rp21.000",
                  isIncome: false,
                ),
                _buildTransactionItem(
                  icon: Icons.add_circle_outline,
                  title: "GoPay Top Up",
                  subtitle: "",
                  amount: "Rp25.000",
                  isIncome: true,
                ),
                _buildDateHeader("Senin, 02 Sep 2024"),
                _buildTransactionItem(
                  icon: Icons.receipt_long,
                  title: "GoBills - PLN Token",
                  subtitle: "50202241506",
                  amount: "-Rp20.400",
                  isIncome: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.arrow_drop_down, size: 18, color: Colors.black54),
        ],
      ),
    );
  }

  Widget _buildDateHeader(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        date,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String amount,
    required bool isIncome,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.shade50,
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: subtitle.isNotEmpty
          ? Text(subtitle,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12))
          : null,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            amount,
            style: TextStyle(
              color: isIncome ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text("GoPay Saldo",
              style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}

class GopayBanner extends StatelessWidget {
  const GopayBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar karakter (di luar box)
          Image.asset(
            'assets/gopay.1.png', // ganti dengan path sesuai kamu
            height: 64,
          ),
          const SizedBox(width: 8),
          // Kotak biru panjang ke kanan
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF007EA7),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  // Teks
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Tinggalin kebiasaan boncos",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Dapetin laporan pengeluaran lebih lengkap di app GoPay.",
                          style: TextStyle(
                            color: Color(0xFFD0F3FF),
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Tombol panah
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Color(0xFF007EA7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
