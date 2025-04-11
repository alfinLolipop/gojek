import 'package:flutter/material.dart';
import 'gofood.dart';

class RidePage extends StatelessWidget {
  const RidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF006309),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/background.png',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FoodPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Met Siang User',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Siap anterin kamu ngincip ketupat',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    PromoWithMap(),
                    SizedBox(height: 24),
                    LocationCardSection(
                      title: 'Politeknik Negeri',
                      subtitle: 'Dekat kampus utama',
                      alamat: 'Jl. Ketintang No.1 Surabaya',
                    ),
                    SizedBox(height: 12),
                    LocationCardSection(
                      title: 'Rumah Bu RT',
                      subtitle: 'Tempat ngumpul warga',
                      alamat: 'Jl. Sukarame No.9',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ------ Promo & Map Section ------

class PromoWithMap extends StatelessWidget {
  const PromoWithMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _PromoBox(),
        _MapBox(),
      ],
    );
  }
}

class _PromoBox extends StatelessWidget {
  const _PromoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 15),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: Container(
          width: double.infinity,
          color: const Color(0xFF00A712),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: const [
              Icon(Icons.shield, color: Colors.white),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lebih aman pakai PerjalananAman+',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Voucher s.d. 10rb jika penjemputan tertunda.\nAktifin sekarang, yuk!',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class _MapBox extends StatelessWidget {
  const _MapBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: const [
            SizedBox(
              height: 160,
              width: double.infinity,
              child: Center(child: Text("Google Map di sini")),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 16),
              child: SearchBar(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: LocationButtons(),
            ),
          ],
        ),
      ),
    );
  }
}

// ------ Components ------

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: const [
          Icon(Icons.radio_button_checked, color: Colors.orange),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'Cari lokasi tujuan',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          Icon(Icons.search),
        ],
      ),
    );
  }
}

class LocationButtons extends StatelessWidget {
  const LocationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.home),
            label: const Text('Simpan Rumah'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black87,
              side: const BorderSide(color: Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.business),
            label: const Text('Simpan Kantor'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black87,
              side: const BorderSide(color: Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
      ],
    );
  }
}

class LocationCardSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String alamat;

  const LocationCardSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.alamat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.access_time, color: Colors.black54),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00A712),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'One Tap',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'GoRide',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Text(
                            'Tunai',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Rp.10.000',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Rp.12.000',
                            style: TextStyle(
                              color: Colors.black45,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const DashedLine(height: 1, color: Colors.grey),
                      const SizedBox(height: 12),
                      Text(
                        alamat,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
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

class DashedLine extends StatelessWidget {
  final double height;
  final Color color;

  const DashedLine({this.height = 1, this.color = Colors.grey, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, height),
      painter: _DashedLinePainter(color),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;

  _DashedLinePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.height;

    const dashWidth = 5.0;
    const dashSpace = 3.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
