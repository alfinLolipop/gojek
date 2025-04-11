import 'package:flutter/material.dart';

class CarPage extends StatelessWidget {
  const CarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Car'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'Ini halaman CarPage',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
