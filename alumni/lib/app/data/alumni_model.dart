class Alumni {
  String id;
  String nama;
  String prodi;
  int tahunLulus;
  String status; 
  double confidenceScore;
  String? urlTemuan;

  Alumni({
    required this.id,
    required this.nama,
    required this.prodi,
    required this.tahunLulus,
    this.status = "Belum Dilacak",
    this.confidenceScore = 0.0,
    this.urlTemuan,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'nama': nama,
    'prodi': prodi,
    'tahunLulus': tahunLulus,
    'status': status,
    'confidenceScore': confidenceScore,
    'urlTemuan': urlTemuan,
  };
}
