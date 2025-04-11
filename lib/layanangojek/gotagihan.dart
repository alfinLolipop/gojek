import 'package:flutter/material.dart';

class GoTagihanPage extends StatelessWidget {
  const GoTagihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00ACC1),
      body: SafeArea(
        child: Column(
          children: [
            // HEADER BIRU FIXED
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF00BCD4), Color(0xFF00ACC1)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.arrow_back, color: Colors.white),
                        const SizedBox(width: 8),
                        Image.asset(
                          'assets/icon_gotagihan.jpg',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'GoTagihan&Pulsa',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.history, color: Colors.white),
                        const SizedBox(width: 16),
                        const Icon(Icons.receipt_long, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // SEARCH BAR PUTIH
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Ketik nama layanan di sini",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // BODY PUTIH MELENGKUNG + SCROLLABLE
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    sectionTitle("Transaksi Terakhir & Rekomendasi Kami"),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        serviceTile1("PLN Token", 'assets/icon_pln.jpg'),
                        serviceTile1("PLN Pascabayar", 'assets/icon_pln.jpg'),
                        serviceTile1("GoPay Later", 'assets/icon_later.jpg'),
                        serviceTile1("GoPay Pinjam", 'assets/icon_pinjam.jpg'),
                        serviceTile1("Mandiri e-Money", 'assets/icon_emoney.jpg'),
                        serviceTile1("Indihome", 'assets/icon_indihome.jpg'),
                        serviceTile1("Telkomsel Halo", 'assets/icon_halo.jpg'),
                        serviceTile1("Telkomsel Hemat", 'assets/icon_telkom.jpg'),
                      ],
                    ),
                    const SizedBox(height: 15),
                    sectionTitle("Promo"),
                    const SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          promoBanner('assets/progih_1.jpg'),
                          const SizedBox(width: 12),
                          promoBanner('assets/progih_2.jpg'),
                          const SizedBox(width: 12),
                          promoBanner('assets/progih_3.jpg'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    sectionTitle("Isi Ulang"),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        serviceTile2("Pulsa", 'assets/pulsa.jpg'),
                        serviceTile2("Paket Data", 'assets/data.jpg'),
                        serviceTile2("PLN", 'assets/pln.jpg'),
                        serviceTile2("Uang Elektronik", 'assets/uang.jpg'),
                        serviceTile2("Telkomsel Hemat Lengkap", 'assets/telkom.jpg'),
                      ],
                    ),
                    const SizedBox(height: 32),
                    sectionTitle("Bayar & Tagihan"),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        serviceTile3("GoPay Later & GoPay Pinjam", 'assets/pinjam.jpg'),
                        serviceTile3("PLN", 'assets/pln.jpg'),
                        serviceTile3("PDAM", 'assets/pdam.jpg'),
                        serviceTile3("Internet & TV Kabel", 'assets/internet.jpg'),
                        serviceTile3("BPJS", 'assets/bpjs.jpg'),
                        serviceTile3("Pascabayar", 'assets/pasca.jpg'),
                        serviceTile3("Digital & Game Voucher", 'assets/game.jpg'),
                        serviceTile3("Angsuran Kredit", 'assets/kredit.jpg'),
                        serviceTile3("Gas PGN", 'assets/gas.jpg'),
                        serviceTile3("TELKOM", 'assets/telkom.jpg'),
                        serviceTile3("Streaming", 'assets/streaming.jpg'),
                        serviceTile3("Asuransi", 'assets/asuran.jpg'),
                        serviceTile3("Biaya Pendidikan", 'assets/pendidikan.jpg'),
                        serviceTile3("IPL", 'assets/ipl.jpg'),
                        serviceTile3("E-invoicing", 'assets/invoic.jpg'),
                        serviceTile3("eKIR", 'assets/ekir.jpg'),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

 Widget serviceTile1(String title, String imagePath) {
  return Container(
    width: 100, // Ukuran tetap
    height: 120,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromARGB(255, 73, 170, 187)), // Garis tepi
      borderRadius: BorderRadius.circular(8), // Sudut melengkung (opsional)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 40,
          height: 40,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
}

Widget serviceTile2(String title, String imagePath) {
  return Container(
    width: 100,
    height: 120,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white, // Warna latar belakang putih
      border: Border.all(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3), // Warna bayangan
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3), // Bayangan ke bawah
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 40,
          height: 40,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
}
Widget serviceTile3(String title, String imagePath) {
  return Container(
    width: 100,
    height: 120,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white, // Warna latar belakang putih
      border: Border.all(color: Colors.grey.shade200),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3), // Warna bayangan
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3), // Bayangan ke bawah
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 40,
          height: 40,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
}

  Widget promoBanner(String assetPath) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
