import 'package:flutter/material.dart';
import 'package:flutter_kalori_takip/home_page.dart';  
import 'package:flutter_kalori_takip/hesaplaBMI.dart';  
import 'package:flutter_kalori_takip/hesaplaKalori.dart';  

void main() {
  runApp(const KaloriTakipApp());
}

class KaloriTakipApp extends StatelessWidget {
  const KaloriTakipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalori Takip Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomePage(), // Direkt HomePage'e yönlendirildi
    );
  }
}


