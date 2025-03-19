import 'package:flutter/material.dart';
import 'package:gojek/layanangojek/goride.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GoSendScreen(),
    );
  }
}

class GoSendScreen extends StatelessWidget {
  const GoSendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
      )
    );
  }
}