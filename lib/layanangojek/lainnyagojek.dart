import 'package:flutter/material.dart';

class LainnyaGojekSheet extends StatelessWidget {
  const LainnyaGojekSheet({super.key});

  Widget buildIconItem(String label, String imagePath) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(imagePath), // gunakan aset lokal
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget buildSection(String title, List<Map<String, String>> items, {bool showSwitch = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              if (showSwitch) ...[
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.more_horiz, size: 16),
                      SizedBox(width: 4),
                      Icon(Icons.more_vert, size: 16),
                    ],
                  ),
                ),
              ]
            ],
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return buildIconItem(item['label']!, item['icon']!);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.95,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              buildSection("Layanan teratas", [
                {"label": "GoRide", "icon": "assets/goride.png"},
                {"label": "GoCar", "icon": "assets/gocar.png"},
                {"label": "GoFood", "icon": "assets/gofood.png"},
                {"label": "GoSend", "icon": "assets/gosend.png"},
                {"label": "GoMart", "icon": "assets/gomart.png"},
                {"label": "GoTagihan", "icon": "assets/gotagihan.png"},
                {"label": "Go Hemat", "icon": "assets/gohemat.png"},
              ]),
              buildSection("Layanan lainnya", [], showSwitch: true),
              buildSection("Pesan makan dan belanja", [
                {"label": "GoFood", "icon": "assets/gofood.png"},
                {"label": "GoMart", "icon": "assets/gomart.png"},
                {"label": "Go Hemat", "icon": "assets/gohemat.png"},
                {"label": "GoShop", "icon": "assets/shop.png"},
                {"label": "GoDinein", "icon": "assets/dinein.png"},
              ]),
              buildSection("Bepergian dan pengiriman", [
                {"label": "GoRide", "icon": "assets/goride.png"},
                {"label": "GoCar", "icon": "assets/gocar.png"},
                {"label": "GoSend", "icon": "assets/gosend.png"},
                {"label": "GoTransit", "icon": "assets/transit.png"},
                {"label": "GoBlueBird", "icon": "assets/blue.png"},
                {"label": "GoBox", "icon": "assets/box.png"},
              ]),
              buildSection("Pembayaran", [
                {"label": "GoTagihan", "icon": "assets/gotagihan.png"},
                {"label": "GoPayLater", "icon": "assets/later.png"},
                {"label": "GoPay coins", "icon": "assets/tabungan.png"},
              ]),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}
