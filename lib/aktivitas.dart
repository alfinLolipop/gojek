import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AktivitasScreen(),
    );
  }
}

class AktivitasScreen extends StatelessWidget {
  const AktivitasScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: promoInfoBox('33', 'Voucher & paket', Colors.orange)),
                  SizedBox(width: 16),
                  Expanded(child: promoInfoBox('0', 'Langganan', Colors.pink)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan kode promo',
                  prefixIcon: Icon(Icons.discount, color: Colors.orange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  filterChip('Apa aja', true),
                  filterChip('Promo Ramadan', false),
                  filterChip('GoFood', false),
                  filterChip('Sahur & Iftar', false),
                ],
              ),
            ),
            SizedBox(height: 10),
            promoSection('Resto jempolan lagi promo nih~', [
              promoCard('Jus Kode, Candi Sidoarjo', '3.31 km', 4.3, 'assets/makanan1.jpg', '40% off'),
              promoCard('Uncle W Chinese Food Halal, Buduran', '2.14 km', 4.8, 'assets/makanan2.jpg', '40% off'),
            ]),
            promoSection('Diskon besar-besaran!', [
              promoCard('Burger Bang, Sidoarjo', '5.12 km', 4.5, 'assets/makanan3.jpg', '50% off'),
              promoCard('Ayam Geprek Mantap, Waru', '3.89 km', 4.6, 'assets/makanan4.jpg', '30% off'),
            ]),
          ],
        ),
      ),
    );
  }

  Widget promoSection(String title, List<Widget> promoCards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: promoCards,
          ),
        ),
        SizedBox(height: 10),
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

  Widget promoCard(String name, String distance, double rating, String imagePath, String discount) {
    return Container(
      width: 280,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(imagePath, width: double.infinity, height: 120, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(5)),
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
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text(distance, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text(rating.toString()),
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
}