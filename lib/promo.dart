import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PromoScreen(),
    );
  }
}

class PromoScreen extends StatelessWidget {
  const PromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promo',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: promoInfoBox('56', 'Voucher & paket', Colors.orange)),
                  SizedBox(width: 16),
                  Expanded(child: promoInfoBox('0', 'Langganan', Colors.pink)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.discount, color: Colors.orange),
                          SizedBox(width: 8),
                          Text('Masukkan kode promo',
                              style: TextStyle(fontSize: 16, color: Colors.black)),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: SizedBox(
    height: 40, // Tinggi filter chip agar pas di dalam ListView
    child: ListView(
      scrollDirection: Axis.horizontal, // Bisa digeser ke kanan/kiri
      children: [
        filterChip('Apa aja', true),
        filterChip('Promo Ramadan', false),
        filterChip('GoFood', false),
        filterChip('Sahur & Iftar', false),
      ],
    ),
  ),
),

            SizedBox(height: 10),
            promoSection('Resto jempolan lagi promo nih~', [
              promoCard('Sambal Bakar Indonesia, Sidoarjo', '1.47 km', 4.9, 'assets/makanan1.jpg', '25k off'),
              promoCard('Uncle W Chinese Food Halal, Buduran', '2.10 km', 4.9, 'assets/makanan2.jpg', '25k off'),
              promoCard('Hisana Fried Chicken, Sidokare', '0.08 km', 4.9, 'assets/makanan3.jpg', '25k off'),
              promoCard('Hisana Fried Chicken, Sidokare', '0.08 km', 4.9, 'assets/makanan3.jpg', '25k off'),

            ]),
            promoSection('Menu sahur & buka di sekitarmu~', [
              promoCard('Hisana Fried Chicken, Sidokare', '0.08 km', 4.9, 'assets/makanan3.jpg', '25k off'),
              promoCard('Rujak Buah 11, Cangkring', '0.09 km', 4.9, 'assets/makanan4.jpg', '25k off'),
              promoCard('Uncle W Chinese Food Halal, Buduran', '2.10 km', 4.9, 'assets/makanan2.jpg', '25k off'),
              promoCard('Uncle W Chinese Food Halal, Buduran', '2.10 km', 4.9, 'assets/makanan2.jpg', '25k off'),
            ]),
            const SizedBox(height: 20), // Tambahkan spasi di sini

                  _promoCard(
                      "assets/promo1.png",
                      "Belanja lebih hemat pakai GoMart!",
                      "GoMart siap antar kebutuhan dapur dalam hitungan menit."),
          ],
        ),
      ),
     bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Indeks untuk halaman Promo
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AktivitasScreen()));
          } else if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatScreen()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Promo'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Aktivitas'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        ],
      ),
    );
  }
}

class AktivitasScreen extends StatelessWidget {
  const AktivitasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aktivitas")),
      body: const Center(child: Text("Halaman Aktivitas")),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: const Center(child: Text("Halaman Chat")),
    );
  }
}

Widget promoSection(String title, List<Widget> promoCards) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      SizedBox(
        height: 230,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          children: promoCards,
        ),
      ),
    ],
  );
}


Widget promoSectionWithButton(String title, List<Widget> promoCards) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(backgroundColor: Colors.green, padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6)),
              child: Text('Lihat semua', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 220,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: promoCards,
        ),
      ),
    ],
  );
}

Widget promoInfoBox(String value, String label, Color color) {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
        SizedBox(height: 6),
        Container(
          height: 4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    ),
  );
}


Widget filterChip(String label, bool isSelected) {
  return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Chip(
      backgroundColor: isSelected ? Colors.green : Colors.grey[200],
      label: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
    ),
  );
}

Widget _promoCard(String imagePath, String title, String description) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          child: Image.asset(imagePath,
              width: double.infinity, height: 150, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(
                    fontSize: 12, color: Colors.grey[600]), // Warna abu-abu
              ),
            ],
          ),
        ),
      ],
    ),
  );
}


Widget promoCard(String name, String distance, double rating, String imagePath, String discount) {
  return Container(
    width: 180,
    margin: EdgeInsets.only(right: 12),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(discount, style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                SizedBox(height: 4),
                Text(distance, style: TextStyle(color: Colors.grey, fontSize: 12)),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 14),
                    SizedBox(width: 4),
                    Text(rating.toString(), style: TextStyle(fontSize: 12)),
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
