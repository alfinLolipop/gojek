import 'package:flutter/material.dart';
import 'package:gojek/saldogopay/bayar.dart';
import 'package:gojek/saldogopay/gopay.dart';
import 'package:gojek/saldogopay/lainnya.dart';
import 'package:gojek/layanangojek/gocar.dart';
import 'package:gojek/layanangojek/gofood.dart';
import 'package:gojek/layanangojek/gofoodhemat.dart';
import 'package:gojek/layanangojek/gomart.dart';
import 'package:gojek/layanangojek/goride.dart';
import 'package:gojek/layanangojek/gosend.dart';
import 'package:gojek/layanangojek/gotagihan.dart';
import 'package:gojek/layanangojek/lainnyagojek.dart';
import 'package:gojek/profil.dart';
import 'package:gojek/saldogopay/topup.dart';
import 'promo.dart';
import 'aktivitas.dart';
import 'chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Cari makanan...',
              prefixIcon: Icon(Icons.search, size: 20),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(fontSize: 14),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 18,
              child: Icon(Icons.person, color: Colors.green, size: 20),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gambar Iklan Infinix yang bisa diklik untuk navigasi ke promo
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PromoScreen()),
                );
              },
              child: Image.asset(
                'assets/iklaninfinix.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

            //const SizedBox(height: 16),

            // Grup Saldo dan Tombol GoPay
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Bagian Saldo yang Bisa Diklik
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                GopayScreen()), // Ganti dengan halaman tujuan
                      );
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/gopay.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rp0',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '0 coins',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Bagian Tombol Aksi
                  Row(
                    children: [
                      _buildClickableButton(
                          Icons.arrow_upward, "Bayar", context, BayarScreen()),
                      const SizedBox(width: 15),
                      _buildClickableButton(
                          Icons.add, "Top Up", context, TopUpScreen()),
                      const SizedBox(width: 15),
                      _buildClickableButton(Icons.more_horiz, "Lainnya",
                          context, LainnyaScreen()),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Menu Layanan Gojek
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                //borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
              ),
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    children: [
                      _menuItem(context, "GoRide", "assets/goride.png", "1RB!",
                          GoRideScreen()),
                      _menuItem(context, "GoCar", "assets/gocar.png", "6RB!",
                          GoCarScreen()),
                      _menuItem(context, "GoFood", "assets/gofood.png", "-75%",
                          GoFoodScreen()),
                      _menuItem(context, "GoSend", "assets/gosend.png", "5RB!",
                          GoSendScreen()),
                      _menuItem(context, "GoMart", "assets/gomart.png", "-40%",
                          GoMartScreen()),
                      _menuItem(context, "GoTagihan", "assets/gotagihan.png",
                          "", GoTagihanScreen()),
                      _menuItem(context, "GoFood Hemat", "assets/gohemat.png",
                          "HEMAT", GoFoodHemarScreen()),
                      _menuItem(context, "Lainnya", "assets/lainnya.png", "",
                          LainnyaGojekScreen()),
                    ],
                  ),

                  const SizedBox(height: 8), // Spasi antara ikon dan banner
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PromoScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Image.asset("assets/promo3.png",
                                  fit: BoxFit.contain),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              "Diskon s.d. 10rb/transaksi. Yuk, langga...",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.arrow_forward,
                                color: Colors.green, size: 16),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  _sectionTitle('Promo Terdekat'),
                  _horizontalScroll([
                    _promoItem(
                        "Martabak", "2.50 km", 4.9, "assets/makanan1.jpg"),
                    _promoItem("Burger King, Sidoarjo", "1.25 km", 4.8,
                        "assets/makanan2.jpg"),
                    _promoItem("Burger King, Sidoarjo", "1.25 km", 4.8,
                        "assets/makanan2.jpg"),
                    _promoItem("Burger King, Sidoarjo", "1.25 km", 4.8,
                        "assets/makanan2.jpg"),
                  ]),

                  _sectionTitle('Rekomendasi Makanan'),
                  _horizontalScroll([
                    _promoItem(
                        "Martabak", "2.50 km", 4.9, "assets/makanan1.jpg"),
                    _promoItem(
                        "Martabak", "2.50 km", 4.9, "assets/makanan1.jpg"),
                    _promoItem(
                        "Martabak", "2.50 km", 4.9, "assets/makanan1.jpg"),
                    _promoItem("Burger King, Sidoarjo", "1.25 km", 4.8,
                        "assets/makanan2.jpg"),
                  ]),

                  const SizedBox(height: 20), // Tambahkan spasi di sini

                  _promoCard(
                      "assets/promo1.png",
                      "Belanja lebih hemat pakai GoMart!",
                      "GoMart siap antar kebutuhan dapur dalam hitungan menit."),
                  _promoCard(
                      "assets/promo2.png",
                      "Langganan Gojek Plus dan nikmati lebih banyak manfaat!",
                      "Pasti dapat diskon di setiap transaksi Gojek!"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PromoScreen()));
          } else if (index == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AktivitasScreen()));
          } else if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatScreen()));
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: 'Promo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'Aktivitas'),
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

Widget _buildClickableButton(
    IconData icon, String label, BuildContext context, Widget page) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    child: Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.black)),
      ],
    ),
  );
}

Widget _menuItem(BuildContext context, String title, String imagePath,
    String promo, Widget destinationScreen,
    {bool isCircle = false}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destinationScreen),
      );
    },
    child: Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 50, // Ukuran lebih kecil
              height: 50,
              decoration: BoxDecoration(
                shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: isCircle
                    ? null
                    : BorderRadius.circular(16), // Sudut hanya untuk non-circle
              ),
              child: ClipRRect(
                borderRadius: isCircle
                    ? BorderRadius.circular(50)
                    : BorderRadius.circular(16),
                child: Image.asset(imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover), // Menyesuaikan gambar agar penuh
              ),
            ),
            if (promo.isNotEmpty)
              Positioned(
                top: -2,
                left: -2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    promo,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

//tombol bentuk kotak
Widget _buildSquareButton(IconData icon, String label) {
  return Column(
    children: [
      Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8), // Sudut melengkung
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
      SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(fontSize: 10, color: Colors.black),
      ),
    ],
  );
}

// Tombol berbentuk lingkaran
Widget _buildCircleButton(IconData icon, String label) {
  return Column(
    children: [
      Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
      SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(fontSize: 10, color: Colors.black),
      ),
    ],
  );
}

Widget _sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    ),
  );
}

Widget _horizontalScroll(List<Widget> items) {
  return SizedBox(
    height: 200,
    child: ListView(scrollDirection: Axis.horizontal, children: items),
  );
}

Widget _promoItem(
    String name, String distance, double rating, String imageUrl) {
  return _foodContainer(name, distance, rating.toString(), imageUrl);
}

Widget _foodContainer(
    String title, String subtitle, String rating, String imageUrl) {
  return Container(
    width: 160,
    margin: const EdgeInsets.only(right: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imageUrl,
              height: 115, width: double.infinity, fit: BoxFit.cover),
        ),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(subtitle, style: TextStyle(color: Colors.grey[700], fontSize: 10)),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.orange, size: 16),
            Text(rating)
          ],
        ),
      ],
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
