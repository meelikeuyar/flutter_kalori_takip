import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BMIHesaplamaEkrani extends StatelessWidget {
  final double kilo;
  final double boy;

  const BMIHesaplamaEkrani({
    Key? key,
    required this.kilo,
    required this.boy,
  }) : super(key: key);

  String bmiYorum(double bmi) {
    if (bmi < 18.5) return "Zayıf";
    if (bmi < 25) return "Normal";
    if (bmi < 30) return "Fazla Kilolu";
    if (bmi < 35) return "1. Derece Obez";
    if (bmi < 40) return "2. Derece Obez";
    return "3. Derece (Morbid) Obez";
  }

  String bmiAciklama(double bmi) {
    if (bmi < 18.5)
      return "Beslenmene dikkat et, sağlıklı kilo almayı düşünebilirsin.";
    if (bmi < 25)
      return "Harika! Sağlıklı kilodasın, bu düzeni korumaya devam et.";
    if (bmi < 30)
      return "Biraz kilo fazlalığın var, dengeli beslenme ve hareket iyi gelir.";
    if (bmi < 35)
      return "Dikkat! Obezite başlangıcı, sağlığın için yaşam tarzı değişikliği gerekebilir.";
    if (bmi < 40)
      return "2. Derece obezite! Sağlık sorunları riskin yüksek, doktoruna danışmalısın.";
    return "Morbid obezite! Ciddi sağlık riski altında olabilirsin, profesyonel destek almalısın.";
  }

  @override
  Widget build(BuildContext context) {
    double bmi = kilo / (boy * boy);
    String yorum = bmiYorum(bmi);
    String aciklama = bmiAciklama(bmi);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32), // Yeni tema rengi
        title: Text(
          'Vücut Kitle Endeksi',
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
              Icons.favorite_rounded,
              color: const Color.fromARGB(255, 205, 20, 115),
              size: 80,
            ),
            const SizedBox(height: 20),
            Text(
              "Vücut Kitle Endeksiniz:",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              bmi.toStringAsFixed(2),
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Durum: $yorum",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFd84315),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              aciklama,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.home, color: Colors.white),
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
            ),
          ],
        ),
      ),
    );
  }
}
