import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GojekPlusPage(),
  ));
}

class GojekPlusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GojekPlusContent(),
      ),
    );
  }
}

class GojekPlusContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header Gojek Plus (Logo, Teks, Tabs)
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/gojekplus.png',
                height: 80,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 12),
              Text(
                'Pasti dapet diskon di setiap transaksi. Yuk, langganan!',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTabButton('90 hari', true),
                  buildTabButton('30 hari', false),
                  buildTabButton('30 Irit', false),
                ],
              )
            ],
          ),
        ),

        // Voucher List
        Expanded(
          child: ListView(
            children: [
              buildVoucherTile(
                iconPath: 'assets/gofood.png',
                title: 'gofood',
                subtitle: 'Diskon hingga 10.000',
                description: 'Jajan yang enak biar mood enak',
                voucher: 900,
                brandColor: Colors.red,
              ),
              buildVoucherTile(
                iconPath: 'assets/goride.png',
                title: 'goride',
                subtitle: 'Diskon hingga 10.000',
                description: 'Udah irit, cepet nyampe pula',
                voucher: 540,
                brandColor: Colors.green.shade700,
              ),
              buildVoucherTile(
                iconPath: 'assets/gocar.png',
                title: 'gocar',
                subtitle: 'Diskon hingga 10.000',
                description: 'Nyaman, dingin, dan aman',
                voucher: 720,
                brandColor: Colors.green,
              ),
            ],
          ),
        ),

        // Bottom Payment Section
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // GoPay Row
              Row(
                children: [
                  // Icon GoPay (bulat biru)
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.lightBlueAccent,
                    child: Icon(Icons.account_balance_wallet,
                        color: Colors.white, size: 16),
                  ),
                  SizedBox(width: 8),
                  Text('GoPay', style: TextStyle(fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle, size: 14, color: Colors.green),
                        SizedBox(width: 4),
                        Text(
                          'Diskon Rp16.000',
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              // Langganan Button
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Text('Langganan 90 hari',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text(
                      '34.900',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '18.900',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.more_horiz, size: 20, color: Colors.grey),
                  ],
                ),
              ),

              SizedBox(height: 8),

              // Catatan
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  children: [
                    TextSpan(text: 'Diperpanjang otomatis seharga '),
                    TextSpan(
                      text: 'Rp34.900',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(text: ' di '),
                    TextSpan(
                      text: '9 Juli.\n',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(text: 'Batalin kapan aja.'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTabButton(String label, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildVoucherTile({
    required String iconPath,
    required String title,
    required String subtitle,
    required String description,
    required int voucher,
    required Color brandColor,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Image.asset(iconPath, width: 40, height: 40),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      TextStyle(color: brandColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(subtitle, style: TextStyle(fontSize: 13)),
                Text(description,
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$voucher',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('voucher', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
