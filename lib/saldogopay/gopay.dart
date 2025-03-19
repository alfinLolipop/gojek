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
      appBar: AppBar(
        title: const Text("GoPay"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          // Filter Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterButton("Tanggal"),
                _buildFilterButton("Layanan"),
                _buildFilterButton("Metode"),
              ],
            ),
          ),
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
                  icon: Icons.shopping_bag,
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
                  icon: Icons.add_circle,
                  title: "GoPay Top Up",
                  subtitle: "",
                  amount: "Rp25.000",
                  isIncome: true,
                ),
                _buildDateHeader("Senin, 02 Sep 2024"),
                _buildTransactionItem(
                  icon: Icons.receipt,
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
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.grey),
        ),
      ),
      child: Text(text),
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
        backgroundColor: Colors.blue.shade100,
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, overflow: TextOverflow.ellipsis),
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
          const Text("GoPay Saldo", style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
