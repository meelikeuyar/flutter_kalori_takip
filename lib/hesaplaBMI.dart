// hesaplaBMI.dart
import 'package:flutter/material.dart';

class BMIHesaplamaEkrani extends StatelessWidget {
  final double kilo;
  final double boy;

  // Constructor
  const BMIHesaplamaEkrani({
    Key? key,
    required this.kilo,
    required this.boy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BMI hesaplama
    double bmi = kilo / (boy * boy);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vücut Kitle Endeksi Hesaplama'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Vücut Kitle Endeksi: ${bmi.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Anasayfaya Geri Dön"),
            ),
          ],
        ),
      ),
    );
  }
}
