import 'package:flutter/material.dart';
import 'home.dart'; // Impor file home.dart

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih sesuai desain
      body: Center(
        child: Image.asset(
          'assets/gojek.jpg', // Pastikan path gambar benar
          width: 200, // Ukuran gambar lebih besar sesuai desain
        ),
      ),
    );
  }
}
