import 'package:flutter/material.dart';

class TopUpScreen extends StatelessWidget {
  const TopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Top up",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                16, 16, 16, 32), // Tambah padding bawah biar lega
            child: Column(
              children: [
                _buildPromoBanner(),
                const SizedBox(height: 20),
                _buildSection(
                  title: "Tambah akun bank",
                  subtitle: "Hubungkan kartu debitmu dan top up dari app Gojek",
                  children: [
                    _buildBankIcon("assets/oneklik.png", "BCA OneKlik"),
                    _buildGratisBankIcon("assets/jago.png", "Jago Pockets"),
                    _buildBankIcon("assets/bri.png", "BRI Direct Debit"),
                    _buildBankIcon("assets/blu.png", "blu by BCA Digital"),
                  ],
                ),
                const SizedBox(height: 20),
                _buildSection(
                  title: "Pakai uang tunai",
                  subtitle: "Di minimarket, warung atau agen terdekat",
                  children: [
                    _buildBankIcon("assets/alfa.png", "Alfamart"),
                    _buildBankIcon("assets/indo.png", "Indomaret"),
                    _buildBankIcon("assets/lawson.png", "Lawson"),
                    _buildBankIcon("assets/mitra.png", "Mitra Tokopedia"),
                    _buildBankIcon("assets/atm.png", "ATM Bersama"),
                    _buildBankIcon("assets/midi.png", "Alfamidi"),
                    _buildBankIcon("assets/dan.png", "Dan+Dan"),
                    _buildBankIcon("assets/pos.png", "Pos Indonesia"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF027A6D), Color(0xFF039889)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green[800],
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              "5x",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: "Nikmatin gratis top up di "),
                  TextSpan(
                    text: "aplikasi GoPay",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String subtitle,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 16),
          _buildGridIcons(children),
        ],
      ),
    );
  }

  Widget _buildGridIcons(List<Widget> children) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 8), // Biar tidak mepet dan overflow
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        clipBehavior: Clip.none,
        crossAxisCount: 4,
        mainAxisSpacing: 20,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7, // Sedikit lebih tinggi agar muat teks
        children: children,
      ),
    );
  }

  Widget _buildBankIcon(String assetPath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(assetPath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Flexible(
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 11.5, height: 1.2),
          ),
        ),
      ],
    );
  }

  Widget _buildGratisBankIcon(String assetPath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(assetPath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: -10,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Gratis",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 28,
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 11.5, height: 1.2),
          ),
        ),
      ],
    );
  }
}
