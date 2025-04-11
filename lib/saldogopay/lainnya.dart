import 'package:flutter/material.dart';

class LainnyaScreen extends StatelessWidget {
  const LainnyaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: Stack(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00C4FF), Color(0xFF00AEEF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // AppBar custom
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        BackButton(color: Colors.white),
                        Text('GoPay',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child:
                              Text('MA', style: TextStyle(color: Colors.black)),
                        )
                      ],
                    ),
                  ),

                  // Promo atas
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'GRATIS GoPay Coins buat kamu🥳',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Check-in setiap hari di A+ Rewards aplikasi GoPay dan klaim GRATIS hingga 2.800 GoPay Coins!',
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {},
                              child: const Text('Check in'),
                            ),
                            const SizedBox(width: 30),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/yy.png',
                                height:
                                    80, // <- Agak dikecilin dikit biar lebih sejajar
                                width: 180,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Card Saldo
                  _buildSaldoCard(),

                  const SizedBox(height: 12),

                  // Menu icon
                  _buildMenuIcons(),

                  const SizedBox(height: 16),

                  // Placeholder Brand Pilihan
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Brand Pilihanmu',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('Contoh brand di sini (Alfamart, XXI, dll)',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaldoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Saldo dan Topup
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('Saldo kamu',
                        style: TextStyle(color: Colors.black54)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: const [
                          Text('Upgrade & raih 10jt',
                              style: TextStyle(
                                  color: Color(0xFF00C853),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(width: 4),
                          Icon(Icons.circle, size: 8, color: Color(0xFF00C853)),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2))
                    ],
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Icon(Icons.add, size: 18, color: Color(0xFF00AEEF)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Text('Rp0',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                SizedBox(width: 6),
                Icon(Icons.expand_more),
              ],
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  _buildMiniItemBox(
                    'Pinjam',
                    'Aktifin sekarang',
                    Icons.account_balance_wallet_outlined,
                    const Color(0xFF00AEEF),
                  ),
                  _buildMiniItemBox(
                    'Coins',
                    '0',
                    Icons.brightness_1_outlined,
                    Colors.blueGrey,
                  ),
                  _buildMiniItemBox(
                    'PayLater',
                    'Aktifin',
                    Icons.credit_card,
                    const Color(0xFF00AEEF),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),

            const SizedBox(height: 12),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Cek metode lain →',
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiniItemBox(
      String title, String subtitle, IconData icon, Color color) {
    return Container(
      width: 160, // agak panjang karena horizontal
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontSize: 12, color: Colors.black)),
              Text(subtitle,
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuIcons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMenuIcon(Icons.upload, 'Bayar'),
                _buildMenuIcon(Icons.add_circle_outline, 'Top up'),
                _buildMenuIcon(Icons.download, 'Minta'),
                _buildMenuIcon(Icons.savings, 'Tabungan', showNotif: true),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Fitur lainnya',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(width: 4),
                Icon(Icons.expand_more),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuIcon(IconData icon, String label, {bool showNotif = false}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: const Color(0xFF00AEEF),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 6),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
        if (showNotif)
          Positioned(
            top: -2,
            right: -2,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
