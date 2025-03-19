import 'package:flutter/material.dart';

class LainnyaScreen extends StatelessWidget {
  const LainnyaScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('GoPay'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'GRATIS GoPay Coins buat kamu 🎉',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Check-in setiap hari di A+ Rewards aplikasi GoPay dan klaim GRATIS hingga 2.800 GoPay Coins!',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {},
                  child: Text('Check in', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Saldo kamu', style: TextStyle(color: Colors.grey)),
                        Text('Rp0', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {},
                      child: Text('Top up'),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pinjam', style: TextStyle(color: Colors.blue)),
                    Text('Coins 0', style: TextStyle(color: Colors.grey)),
                    Text('Aktifkan Sekarang', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                _buildMenuItem(Icons.payment, 'Bayar'),
                _buildMenuItem(Icons.add_circle, 'Top up'),
                _buildMenuItem(Icons.arrow_downward, 'Minta'),
                _buildMenuItem(Icons.savings, 'Tabungan'),
                _buildMenuItem(Icons.account_balance, 'Transfer bank'),
                _buildMenuItem(Icons.credit_card, 'Jago'),
                _buildMenuItem(Icons.shopping_cart, 'PayLater'),
                _buildMenuItem(Icons.attach_money, 'Pinjam'),
                _buildMenuItem(Icons.history, 'Riwayat'),
                _buildMenuItem(Icons.help, 'Bantuan'),
                _buildMenuItem(Icons.settings, 'Pengaturan'),
                _buildMenuItem(Icons.security, 'Pinjam BPKB'),
                _buildMenuItem(Icons.money, 'Tarik Tunai'),
                _buildMenuItem(Icons.card_giftcard, 'Hadiah'),
                _buildMenuItem(Icons.star, 'Plus'),
                _buildMenuItem(Icons.receipt, 'GoTagihan'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 4),
        Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}