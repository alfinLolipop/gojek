import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart' as custom_carousel;
import 'package:gojek/layanangojek/gocar.dart';
import 'gocar.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final custom_carousel.CarouselSliderController _controller =
      custom_carousel.CarouselSliderController();
  int _currentIndex = 0;

  final List<String> imagePaths = [
    'assets/promoayam.png',
    'assets/promodua.png',
    'assets/promotiga.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CarouselSlider(
                items: imagePaths.map((path) {
                  return Image.asset(
                    path,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  );
                }).toList(),
                carouselController: _controller,
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              Positioned(
                top: 40,
                left: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const CarPage()),
  );
},

                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imagePaths.asMap().entries.map((entry) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == entry.key
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                bottom: -20,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E0E0),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.black87),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Cari makanan favorit...',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40), // buat kasih jarak search bar
          Expanded(
  child: ListView(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    children: [
      const SizedBox(height: 16),

      // ⬇️ Grid horizontal scroll
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: const [
            FoodItemCard(title: 'Ketupat Sayur', description: 'Lodeh gurih'),
            SizedBox(width: 12),
            FoodItemCard(title: 'Opor Ayam', description: 'Ayam empuk'),
            SizedBox(width: 12),
            FoodItemCard(title: 'Rendang', description: 'Daging legit'),
            SizedBox(width: 12),
            FoodItemCard(title: 'Sambal Goreng', description: 'Mantap pedas'),
            SizedBox(width: 12),
            FoodItemCard(title: 'Sayur Nangka', description: 'Gurih enak'),
          ],
        ),
      ),

      const SizedBox(height: 24),

      // ⬇️ Flash Sale Section
      Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Color(0xFFFFF9C4),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.flash_on, color: Colors.orange),
                SizedBox(width: 8),
                Text(
                  'Flash Sale',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Text(
              'Diskon Cemilan Sore Mulai 35%',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Horizontal scroll flash items
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(4, (index) {
                  return Container(
                    width: 200,
                    margin: EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/mixue.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'Mixue Murah Meriah',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),

      const SizedBox(height: 24),

      // ⬇️ Resto dengan Rating Jempol
      const Text(
        'Resto dengan Rating Jempol',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 12),

SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: List.generate(5, (index) {
      return Padding(
        padding: const EdgeInsets.only(right: 12),
        child: RestoCard(
          imagePath: 'assets/restosushi.jpg', // Pastikan file ini ada
          title: 'Resto Enak',
        ),
      );
    }),
  ),
),
const SizedBox(height: 24),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text(
      'Isi perut sore sore',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    TextButton(
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFFD0F0C0), // hijau muda
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        // Action ketika tombol diklik
      },
      child: const Text(
        'Lihat Semua',
        style: TextStyle(
          color: Color(0xFF2E7D32), // hijau tua
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),

const SizedBox(height: 16),

SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: List.generate(10, (index) {
      return Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/bunderburger.jpg', // assets: food1.jpg - food5.jpg
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Menu ${index + 1}',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      );
    }),
  ),
),

const SizedBox(height: 16),

SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: List.generate(10, (index) {
      return Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/bunderburger.jpg', // Pastikan gambar ada
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Makanan ${index + 1}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
          ],
        ),
      );
    }),
  ),
),
    ],
  ),
),
        ],
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final String title;
  final String description;

  const FoodItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 6),
          Text(description,
              style: const TextStyle(
                color: Colors.black54,
              )),
        ],
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String title;
  final String description;

  const FoodItemCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/diskon.jpg', // GANTI sesuai nama gambar lo
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 4),
          Text(description,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 12,
              )),
        ],
      ),
    );
  }
}

class RestoCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const RestoCard({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      '5.0',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
