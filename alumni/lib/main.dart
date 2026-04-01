import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/home/home_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Alumni Tracker',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Inject Controller
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alumni Tracker - Adnan Amhar"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: controller.listAlumni.length,
          itemBuilder: (context, index) {
            var alumni = controller.listAlumni[index];
            return Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: _getStatusColor(alumni.status),
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                title: Text(
                  alumni.nama,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Prodi: ${alumni.prodi} (${alumni.tahunLulus})"),
                    Text(
                      "Status: ${alumni.status}",
                      style: TextStyle(
                        color: _getStatusColor(alumni.status),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (alumni.confidenceScore > 0)
                      Text(
                        "Confidence Score: ${(alumni.confidenceScore * 100).toInt()}%",
                      ),
                  ],
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.manage_search, color: Colors.blue),
                  onPressed: () => controller.jalankanPelacakan(alumni),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Helper untuk warna status
  Color _getStatusColor(String status) {
    switch (status) {
      case "Teridentifikasi Otomatis":
        return Colors.green;
      case "Perlu Verifikasi Manual":
        return Colors.orange;
      case "Sedang Melacak...":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}