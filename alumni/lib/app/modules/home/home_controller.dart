import 'package:get/get.dart';
import '../../data/alumni_model.dart';

class HomeController extends GetxController {
  var listAlumni = <Alumni>[
  Alumni(id: "1", nama: "Adnan Amhar", prodi: "Informatika", tahunLulus: 2023, status: "Teridentifikasi Otomatis", confidenceScore: 1.0),
  Alumni(id: "2", nama: "Ahmad Fauzi", prodi: "Informatika", tahunLulus: 2020, status: "Belum Dilacak"),
  Alumni(id: "3", nama: "Siti Aminah", prodi: "Informatika", tahunLulus: 2021, status: "Perlu Verifikasi Manual", confidenceScore: 0.5),
  Alumni(id: "4", nama: "Budi Cahyono", prodi: "Informatika", tahunLulus: 2019, status: "Teridentifikasi Otomatis", confidenceScore: 0.9),
  Alumni(id: "5", nama: "Dewi Lestari", prodi: "Informatika", tahunLulus: 2022, status: "Belum Dilacak"),
  Alumni(id: "6", nama: "Eko Prasetyo", prodi: "Informatika", tahunLulus: 2020, status: "Perlu Verifikasi Manual", confidenceScore: 0.4),
  Alumni(id: "7", nama: "Fajar Nugraha", prodi: "Informatika", tahunLulus: 2023, status: "Teridentifikasi Otomatis", confidenceScore: 0.85),
  Alumni(id: "8", nama: "Gita Permata", prodi: "Informatika", tahunLulus: 2021, status: "Belum Dilacak"),
  Alumni(id: "9", nama: "Hendra Wijaya", prodi: "Informatika", tahunLulus: 2018, status: "Perlu Verifikasi Manual", confidenceScore: 0.6),
  Alumni(id: "10", nama: "Indah Sari", prodi: "Informatika", tahunLulus: 2022, status: "Teridentifikasi Otomatis", confidenceScore: 0.95),
  Alumni(id: "11", nama: "Joko Susilo", prodi: "Informatika", tahunLulus: 2017, status: "Belum Dilacak"),
  Alumni(id: "12", nama: "Kartika Putri", prodi: "Informatika", tahunLulus: 2020, status: "Perlu Verifikasi Manual", confidenceScore: 0.55),
  Alumni(id: "13", nama: "Lutfi Hakim", prodi: "Informatika", tahunLulus: 2023, status: "Teridentifikasi Otomatis", confidenceScore: 0.88),
  Alumni(id: "14", nama: "Maya Rahayu", prodi: "Informatika", tahunLulus: 2019, status: "Belum Dilacak"),
  Alumni(id: "15", nama: "Nanda Saputra", prodi: "Informatika", tahunLulus: 2021, status: "Perlu Verifikasi Manual", confidenceScore: 0.45),
  Alumni(id: "16", nama: "Oki Setiawan", prodi: "Informatika", tahunLulus: 2022, status: "Teridentifikasi Otomatis", confidenceScore: 0.92),
  Alumni(id: "17", nama: "Putri Utami", prodi: "Informatika", tahunLulus: 2020, status: "Belum Dilacak"),
  Alumni(id: "18", nama: "Rian Hidayat", prodi: "Informatika", tahunLulus: 2018, status: "Perlu Verifikasi Manual", confidenceScore: 0.5),
  Alumni(id: "19", nama: "Siska Amelia", prodi: "Informatika", tahunLulus: 2023, status: "Teridentifikasi Otomatis", confidenceScore: 0.98),
  Alumni(id: "20", nama: "Taufik Ismail", prodi: "Informatika", tahunLulus: 2021, status: "Belum Dilacak"),
].obs;

  Future<void> jalankanPelacakan(Alumni alumni) async {
  alumni.status = "Sedang Melacak...";
  listAlumni.refresh();

  await Future.delayed(const Duration(seconds: 2)); 

  double score = 0.0;

  List<String> namaKunci = ["Adnan", "Budi", "Indah", "Lutfi", "Oki", "Siska", "Fajar"];
  for (var key in namaKunci) {
    if (alumni.nama.contains(key)) {
      score += 0.5; 
      break;
    }
  }

  if (alumni.tahunLulus >= 2022) {
    score += 0.4;
  } else {
    score += 0.2;
  }

  alumni.confidenceScore = score;

  if (score >= 0.8) {
    alumni.status = "Teridentifikasi Otomatis"; 
    alumni.urlTemuan = "https://linkedin.com/in/${alumni.nama.replaceAll(' ', '').toLowerCase()}";
  } else {
    alumni.status = "Perlu Verifikasi Manual"; 
  }
  
  listAlumni.refresh(); 
}
}
