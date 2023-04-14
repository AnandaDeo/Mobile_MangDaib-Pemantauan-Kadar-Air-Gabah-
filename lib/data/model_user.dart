class User {
  final String jenis;
  final String massa;
  final String kadar_air_awal;
  final String durasi;
  final String suhu;
  final String kadar_air_akhir;
  final String keterangan;

  const User({
    required this.jenis,
    required this.massa,
    required this.kadar_air_awal,
    required this.durasi,
    required this.suhu,
    required this.kadar_air_akhir,
    required this.keterangan,
  });

  User copy({
    String? jenis,
    String? massa,
    String? kadar_air_awal,
    String? durasi,
    String? suhu,
    String? kadar_air_akhir,
    String? keterangan

  }) =>
      User(
        jenis: jenis ?? this.jenis,
        massa: massa ?? this.massa,
        kadar_air_awal: kadar_air_awal ?? this.kadar_air_awal,
        durasi: durasi ?? this.durasi,
        suhu: suhu ?? this.suhu,
        kadar_air_akhir: kadar_air_akhir ?? this.kadar_air_akhir,
        keterangan: keterangan ?? this.keterangan,


      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          jenis == other.jenis &&
          massa == other.massa &&
          durasi == other.durasi &&
          kadar_air_awal == other.kadar_air_awal &&
          suhu == other.suhu &&
          kadar_air_akhir == other.kadar_air_akhir &&
          keterangan == other.keterangan;


  @override
  int get hashCode => jenis.hashCode ^ massa.hashCode ^ durasi.hashCode ^ kadar_air_awal.hashCode ^ suhu.hashCode ^ kadar_air_akhir.hashCode ^ keterangan.hashCode;
  
}
