import 'package:flutter/material.dart';

class HesaplaKalori extends StatelessWidget {
  final String cinsiyet;
  final double kilo;
  final double boy;
  final int yas;
  final double aktiviteCarpani; 

  const HesaplaKalori({
    required this.cinsiyet,
    required this.kilo,
    required this.boy,
    required this.yas,
    required this.aktiviteCarpani, 
    super.key,
  });

  double hesaplaKalori() {
    double bazalMetabolizma;
    
    if (cinsiyet == "Erkek") {
      bazalMetabolizma = 66 + (13.7 * kilo) + (5 * (boy * 100)) - (4.7 * yas);
    } else {
      bazalMetabolizma = 655 + (9.6 * kilo) + (1.8 * (boy * 100)) - (4.7 * yas);
    }

    return bazalMetabolizma * aktiviteCarpani; 
  }

  @override
  Widget build(BuildContext context) {
    double kalori = hesaplaKalori();

    return Scaffold(
      appBar: AppBar(title: const Text("Kalori Hesaplama")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Günlük Kalori İhtiyacınız: ${kalori.toStringAsFixed(2)} kcal"),
          ],
        ),
      ),
    );
  }
}



