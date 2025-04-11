import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Gomart(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}

class Gomart extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Gomart> {
  int selectedIndex = 0;
  int _currentBannerIndex = 0;
  final PageController _pageController = PageController();
  late Timer _timer;

  final List<String> bannerImages = [
    "assets/iklan_promo.jpg",
    "assets/iklan_glad.jpg",
    "assets/iklan_majika.jpg",
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentBannerIndex < bannerImages.length - 1) {
        _currentBannerIndex++;
      } else {
        _currentBannerIndex = 0;
      }

      _pageController.animateToPage(
        _currentBannerIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Eksplor"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Pencarian"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Belanjaan"),
        ],
      ),
    );
  }

Widget getBody() {
    return SafeArea(
      child: ListView(
        children: [
          Stack(
            children: [
              // BANNER
              SizedBox(
                height: 230,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: bannerImages.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      bannerImages[index],
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                  onPageChanged: (index) {
                    setState(() {
                      _currentBannerIndex = index;
                    });
                  },
                ),
              ),

              // CLOSE & LOKASI
              Positioned(
                top: 10,
                left: 10,
                child: Row(
                  children: [
                    Icon(Icons.close, color: Colors.white),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.white, size: 18),
                          Text('Cb Grazacx', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // PADDING TEKS DISKON
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                // Search Bar & Info Delivery
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Let's prepare sandals for the rain",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                          Icon(Icons.card_giftcard, color: Colors.red),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delivery_dining, size: 18, color: Colors.black87),
                            SizedBox(width: 6),
                            Text(
                              "Sampai dalam 30 menit",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Biar semangat diskonnya s.d 40%",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                kategoriItem("Perawatan Diri", "assets/glad.jpg", Colors.pink[100]!),
                kategoriItem("Pembersih", "assets/wipol.jpg", Colors.blue[100]!),
                kategoriItem("Dekor Kamar", "assets/kamar.jpg", const Color.fromARGB(255, 123, 223, 83)!),
                kategoriItem("Alat Tulis", "assets/atk.jpg", const Color.fromARGB(255, 177, 134, 53)!),
                kategoriItem("Make Up", "assets/make_up.jpg", const Color.fromARGB(255, 148, 53, 177)!),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/promo.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 230,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        produkDiskonItem1(
                          discount: "32%",
                          image: "assets/mineral.jpg",
                          hargaCoret: "Rp21.900",
                          hargaDiskon: "Rp14.900",
                          namaProduk: "Le Minerale Air Mineral Galon 15 L",
                        ),
                        produkDiskonItem1(
                          discount: "10%",
                          image: "assets/susu.jpg",
                          hargaCoret: "Rp18.900",
                          hargaDiskon: "Rp16.900",
                          namaProduk: "Ultra Milk Susu UHT Full Cream",
                        ),
                        produkDiskonItem1(
                          discount: "10%",
                          image: "assets/marjan.jpg",
                          hargaCoret: "Rp18.900",
                          hargaDiskon: "Rp16.900",
                          namaProduk: "Marjan Boudoin Sirup Melon Botol",
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    produkDiskonItem2(
                      discount: "40%",
                      image: "assets/scarlett.jpg",
                      hargaCoret: "Rp8.500",
                      hargaDiskon: "Rp6.700",
                      namaProduk: "Scarlett Whitening Eau De Parfum",
                    ),
                    produkDiskonItem2(
                      discount: "5%",
                      image: "assets/kahf.jpg",
                      hargaCoret: "Rp15.000",
                      hargaDiskon: "Rp13.500",
                      namaProduk: "Kahf Face Wash Skin Energizing",
                    ),
                    produkDiskonItem2(
                      discount: "5%",
                      image: "assets/sos.jpg",
                      hargaCoret: "Rp13.900",
                      hargaDiskon: "Rp13.200",
                      namaProduk: "SOS Pembersih Lantai 675 ml",
                    ),
                    produkDiskonItem2(
                      discount: "5%",
                      image: "assets/A4.jpg",
                      hargaCoret: "Rp26.500",
                      hargaDiskon: "Rp25.900",
                      namaProduk: "Kiky A4 Paper 80 Gsm 100 Lembarr",
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget kategoriItem(String title, String imagePath, Color color) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 6),
        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

 Widget produkDiskonItem1({
  required String discount,
  required String image,
  required String hargaCoret,
  required String hargaDiskon,
  required String namaProduk,
}) {
  return Container(
    width: 140,
    margin: EdgeInsets.only(right: 12),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Diskon
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            discount,
            style: TextStyle(color: Colors.white, fontSize: 11),
          ),
        ),
        SizedBox(height: 6),
        // Gambar dengan tombol +
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 90,
                width: double.infinity,
                color: const Color.fromARGB(255, 201, 194, 194),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              bottom: 6,
              right: 6,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.green,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 6),
        // Harga
        Text(
            hargaDiskon,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
         Text(
          hargaCoret,
          style: TextStyle(
            decoration: TextDecoration.lineThrough,
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 4),
        // Nama Produk
        Text(
          namaProduk,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
}


Widget produkDiskonItem2({
  required String discount,
  required String image,
  required String hargaCoret,
  required String hargaDiskon,
  required String namaProduk,
}) {
  return Container(
    width: 140,
    margin: EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    ),
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stack hanya untuk gambar + icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    image,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                // Tombol tambah di pojok kanan bawah gambar
        Positioned(
          bottom: 8,
          right: 8,
          child: GestureDetector(
            onTap: () {
              // TODO: Tambahkan ke keranjang
            },
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Icon(Icons.add, color: Colors.green, size: 16),
            ),
          ),
        ),
                // Badge diskon (pojok kiri atas gambar)
                if (discount.isNotEmpty)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        discount,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // Info produk di bawah gambar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hargaCoret.isNotEmpty) ...[
                    Text(
                      hargaCoret,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(height: 2),
                  ],
                  Text(
                    hargaDiskon,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    namaProduk,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
}
