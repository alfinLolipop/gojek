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
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profilku"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Text(
                      "MA",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Muhammad Alfin",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text("alfinmuhammad379@gmail.com",
                            style: TextStyle(color: Colors.grey[600])),
                        Text("+6285748905105",
                            style: TextStyle(color: Colors.grey[600])),
                      ],
                    ),
                  ),
                  const Icon(Icons.edit, color: Colors.grey),
                ],
              ),
            ),
            Divider(height: 1, thickness: 8, color: Colors.grey[200]),
            buildMenuSection("Akun", [
              buildMenuItem("assets/profile/aktivitasku.png", "Aktivitasku",
                  "Cek riwayat & aktivitas aktif"),
              buildMenuItem("assets/profile/gojek_plus.png", "Gojek PLUS"),
              buildMenuItem("assets/profile/promo.png", "Promo"),
              buildMenuItem(
                  "assets/profile/metode_pembayaran.png", "Metode Pembayaran"),
              buildMenuItem(
                  "assets/profile/pusat_bantuan.png", "Pusat bantuan"),
              buildMenuItem(
                  "assets/profile/profil_bisnis.png", "Profil bisnis"),
              buildMenuItem(
                  "assets/profile/pilihan_bahasa.png", "Pilihan bahasa"),
              buildMenuItem(
                  "assets/profile/alamat_favorit.png", "Alamat favorit"),
              buildMenuItem("assets/profile/aksebilitas.png", "Aksesibilitas"),
              buildMenuItem(
                  "assets/profile/ajak_teman.png", "Ajak teman, dapat voucher"),
              buildMenuItem("assets/profile/notif.png", "Notifikasi"),
              buildMenuItemWithBadge("assets/profile/kebijakan_privasi.png",
                  "Keamanan akun", "Baru"),
              buildMenuItem("assets/profile/atur_akun.png", "Atur akun"),
            ]),
            buildMenuSection("Info lainnya", [
              buildMenuItem(
                  "assets/profile/kebijakan_privasi.png", "Kebijakan Privasi"),
              buildMenuItem(
                  "assets/profile/ketentuan_layanan.png", "Ketentuan Layanan"),
              buildMenuItem(
                  "assets/profile/atribusi_data.png", "Atribusi data"),
              buildMenuItemWithTrailingText(
                "assets/profile/beri_rating.png",
                "Beri rating",
                "v 5.13.1",
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildMenuSection(String title, List<Widget> children) {
    return Container(
      color:
          Colors.white, // Bungkus semua bagian section: title + item + divider
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700]),
            ),
          ),
          Column(children: children),
          Divider(height: 1, thickness: 8, color: Colors.grey[200]),
        ],
      ),
    );
  }

  Widget buildMenuItemWithTrailingText(
      String iconPath, String title, String trailingText) {
    return ListTile(
      leading: Image.asset(iconPath, width: 32, height: 32), // Diperbesar
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            trailingText,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
      onTap: () {},
    );
  }

  Widget buildMenuItem(String iconPath, String title, [String? subtitle]) {
    return ListTile(
      leading: Image.asset(iconPath, width: 32, height: 32), // Diperbesar
      title: Text(title),
      subtitle: subtitle != null
          ? Text(subtitle, style: TextStyle(color: Colors.grey[600]))
          : null,
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }

  Widget buildMenuItemWithBadge(
      String iconPath, String title, String badgeText) {
    return ListTile(
      leading: Image.asset(iconPath, width: 32, height: 32), // Diperbesar
      title: Row(
        children: [
          Text(title),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(12)),
            child: Text(
              badgeText,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}
