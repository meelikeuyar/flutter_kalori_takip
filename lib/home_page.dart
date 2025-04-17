import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_kalori_takip/hesaplaBMI.dart';
import 'package:flutter_kalori_takip/hesaplaKalori.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController kiloController = TextEditingController();
  final TextEditingController boyController = TextEditingController();
  final TextEditingController yasController = TextEditingController();
  String cinsiyet = "Erkek";
  String aktiviteSeviyesi = "Hareketsiz";

  final Map<String, double> aktiviteCarpanlari = {
    "Hareketsiz": 1.2,
    "Az Aktif": 1.375,
    "Orta Aktif": 1.55,
    "Çok Aktif": 1.725,
  };

  final Color anaYesil = const Color(0xFF2E7D32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kalori Takip",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: anaYesil,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  "assets/images/vki.jpeg",
                  height: 120,
                ),
                const SizedBox(height: 20),
                Text(
                  "Kalori Takip Uygulamasına Hoş Geldiniz!",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: anaYesil,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Cinsiyet: ",
                        style: GoogleFonts.poppins(fontSize: 18)),
                    DropdownButton<String>(
                      value: cinsiyet,
                      onChanged: (String? newValue) {
                        setState(() {
                          cinsiyet = newValue!;
                        });
                      },
                      items: ["Erkek", "Kadın"]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: GoogleFonts.poppins(fontSize: 16)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                DropdownButton<String>(
                  value: aktiviteSeviyesi,
                  onChanged: (String? newValue) {
                    setState(() {
                      aktiviteSeviyesi = newValue!;
                    });
                  },
                  items: aktiviteCarpanlari.keys
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child:
                          Text(value, style: GoogleFonts.poppins(fontSize: 16)),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: boyController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Boy (metre cinsinden)",
                    labelStyle: GoogleFonts.poppins(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: kiloController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Kilo (kg cinsinden)",
                    labelStyle: GoogleFonts.poppins(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: yasController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Yaş",
                    labelStyle: GoogleFonts.poppins(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    double kilo = double.tryParse(kiloController.text) ?? 0;
                    double boy = double.tryParse(boyController.text) ?? 0;
                    int yas = int.tryParse(yasController.text) ?? 0;
                    double aktiviteCarpani =
                        aktiviteCarpanlari[aktiviteSeviyesi] ?? 1.2;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HesaplaKalori(
                          cinsiyet: cinsiyet,
                          kilo: kilo,
                          boy: boy,
                          yas: yas,
                          aktiviteCarpani: aktiviteCarpani,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    "Kalori Hesapla",
                    style: GoogleFonts.poppins(
                        fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BMIHesaplamaEkrani(
                          kilo: double.tryParse(kiloController.text) ?? 0,
                          boy: double.tryParse(boyController.text) ?? 0,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: anaYesil,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Text(
                    "Vücut Kitle Endeksi Hesapla",
                    style: GoogleFonts.poppins(
                        fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
