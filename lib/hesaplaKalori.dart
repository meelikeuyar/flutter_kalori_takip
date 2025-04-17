import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      bazalMetabolizma = 66 + (13.7 * kilo) + (5 * (boy * 100)) - (6.8 * yas);
    } else {
      bazalMetabolizma = 655 + (9.6 * kilo) + (1.8 * (boy * 100)) - (4.7 * yas);
    }

    return bazalMetabolizma * aktiviteCarpani;
  }

  @override
  Widget build(BuildContext context) {
    double kalori = hesaplaKalori();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32), // Yeni tema rengi
        title: Text(
          "Kalori Hesaplama",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_fire_department,
              color: const Color.fromARGB(255, 240, 102, 4),
              size: 80,
            ),
            const SizedBox(height: 30),
            Text(
              "Günlük Kalori İhtiyacınız",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2E7D32),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "${kalori.toStringAsFixed(2)} kcal",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              label: Text(
                "Ana Sayfaya Dön",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
