import 'package:get/get.dart';
import '../../data/alumni_model.dart';


class HomeController extends GetxController {
  var listAlumni = <Alumni>[].obs;

  // Simulasi Step 4 & 5: Generate Query & Ambil Data
  Future<void> jalankanPelacakan(Alumni alumni) async {
    alumni.status = "Sedang Melacak...";
    listAlumni.refresh();

    await Future.delayed(Duration(seconds: 2)); // Simulasi proses network

    // Step 7: Simulasi Disambiguasi (Scoring)
    // Misal: Kita temukan data "Ahmad Fauzi" di LinkedIn yang lulus 2020
    double score = 0.0;
    if (alumni.nama.contains("Adnan")) score += 0.5;
    if (alumni.tahunLulus == 2023) score += 0.5;

    // Step 9: Penetapan Status
    if (score >= 0.8) {
      alumni.status = "Teridentifikasi Otomatis";
      alumni.urlTemuan = "https://linkedin.com/in/dummy-profile";
    } else {
      alumni.status = "Perlu Verifikasi Manual";
    }

    alumni.confidenceScore = score;
    listAlumni.refresh();
  }
}
