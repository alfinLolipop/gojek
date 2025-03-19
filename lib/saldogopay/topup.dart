import 'package:flutter/material.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top up"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPromoBanner(),
              const SizedBox(height: 16),
              _buildSectionTitle("Tambah akun bank"),
              _buildBankOptions(),
              const SizedBox(height: 16),
              _buildSectionTitle("Pakai uang tunai"),
              _buildCashOptions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(Icons.star, color: Colors.white),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "Nikmati gratis top up di aplikasi GoPay",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildBankOptions() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildBankIcon("assets/bca.png", "BCA OneKlik"),
        _buildBankIcon("assets/jago.png", "Jago Pockets"),
        _buildBankIcon("assets/bri.png", "BRI Direct Debit"),
        _buildBankIcon("assets/blu.png", "blu by BCA Digital"),
      ],
    );
  }

  Widget _buildCashOptions() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _buildBankIcon("assets/alfamart.png", "Alfamart"),
        _buildBankIcon("assets/indomaret.png", "Indomaret"),
        _buildBankIcon("assets/lawson.png", "Lawson"),
        _buildBankIcon("assets/mitra.png", "Mitra Tokopedia"),
        _buildBankIcon("assets/atm.png", "ATM Bersama"),
        _buildBankIcon("assets/alfamidi.png", "Alfamidi"),
        _buildBankIcon("assets/dandan.png", "Dan+Dan"),
        _buildBankIcon("assets/pos.png", "Pos Indonesia"),
      ],
    );
  }

  Widget _buildBankIcon(String assetPath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(assetPath),
          radius: 24,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
