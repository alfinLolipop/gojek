import 'package:flutter/material.dart';
import 'splash.dart';

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
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Ayam Bakar',
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: const [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.green),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mau Ramadan Full',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Siapin kebutuhan puasa kamu pake Gojek!',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Rp0', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text('0 coins', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.payment, color: Colors.blue),
                            SizedBox(width: 10),
                            Icon(Icons.add, color: Colors.blue),
                            SizedBox(width: 10),
                            Icon(Icons.more_horiz, color: Colors.blue),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    children: [
                      _menuItem('GoRide', Icons.motorcycle),
                      _menuItem('GoCar', Icons.local_taxi),
                      _menuItem('GoFood', Icons.restaurant),
                      _menuItem('GoSend', Icons.local_shipping),
                      _menuItem('GoMart', Icons.shopping_cart),
                      _menuItem('GoTagihan', Icons.receipt),
                      _menuItem('GoFood Hemat', Icons.fastfood),
                      _menuItem('Lainnya', Icons.more_horiz),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Diskon s.d. 10rb/transaksi. Yuk, langganan! ',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Tambahan UI berdasarkan gambar yang dikirim
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _promoItem("Martabak Pecenongan 78", "2.50 km", 4.9),
                        _promoItem("Burger King, Sidoarjo", "1.25 km", 4.8),
                        _promoItem("Martabak Pecenongan 78", "2.50 km", 4.9),
                        _promoItem("Martabak Pecenongan 78", "2.50 km", 4.9),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Makan Maksimal 28rb termasuk ongkir',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _foodItem("Udang Keju", "Mie Gacoan", "13.500", 4.8, "1rb+ terjual"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Promo'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Aktivitas'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        ],
      ),
    );
  }

  Widget _menuItem(String title, IconData icon) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.green[100],
          child: Icon(icon, color: Colors.green),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _promoItem(String name, String distance, double rating) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(distance, style: TextStyle(color: Colors.grey[700])),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 16),
              Text(rating.toString()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _foodItem(String name, String restaurant, String price, double rating, String sold) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(restaurant, style: TextStyle(color: Colors.grey[700])),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.green, size: 16),
              Text("$rating ($sold)"),
            ],
          ),
          Text("Rp $price", style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
