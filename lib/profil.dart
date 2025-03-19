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
              buildMenuItem("assets/icons/history.png", "Aktivitasku", "Cek riwayat & aktivitas aktif"),
              buildMenuItem("assets/icons/gojek_plus.png", "Gojek PLUS"),
              buildMenuItem("assets/icons/promo.png", "Promo"),
              buildMenuItem("assets/icons/wallet.png", "Metode Pembayaran"),
              buildMenuItem("assets/icons/help.png", "Pusat bantuan"),
              buildMenuItem("assets/icons/business.png", "Profil bisnis"),
              buildMenuItem("assets/icons/language.png", "Pilihan bahasa"),
              buildMenuItem("assets/icons/location.png", "Alamat favorit"),
              buildMenuItem("assets/icons/accessibility.png", "Aksesibilitas"),
              buildMenuItem("assets/icons/friends.png", "Ajak teman, dapat voucher"),
              buildMenuItem("assets/icons/notifications.png", "Notifikasi"),
              buildMenuItemWithBadge("assets/icons/security.png", "Keamanan akun", "Baru"),
              buildMenuItem("assets/icons/settings.png", "Atur akun"),
            ]),
            buildMenuSection("Info lainnya", [
              buildMenuItem("assets/icons/privacy.png", "Kebijakan Privasi"),
              buildMenuItem("assets/icons/terms.png", "Ketentuan Layanan"),
              buildMenuItem("assets/icons/info.png", "Atribusi data"),
              buildMenuItem("assets/icons/star.png", "Beri rating"),
            ]),
            const SizedBox(height: 20),
            const Text("v 5.13.1", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildMenuSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
          ),
        ),
        Column(children: children),
        Divider(height: 1, thickness: 8, color: Colors.grey[200]),
      ],
    );
  }

  Widget buildMenuItem(String iconPath, String title, [String? subtitle]) {
    return ListTile(
      leading: Image.asset(iconPath, width: 24, height: 24),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle, style: TextStyle(color: Colors.grey[600])) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }

  Widget buildMenuItemWithBadge(String iconPath, String title, String badgeText) {
    return ListTile(
      leading: Image.asset(iconPath, width: 24, height: 24),
      title: Row(
        children: [
          Text(title),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12)),
            child: Text(
              badgeText,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}
