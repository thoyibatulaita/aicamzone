class Aicamzone{
  final int id;
  final String nama_barang;
  final String deskripsi;
  final String img_url;
  final String harga;
  final bool isBookmark;

  Aicamzone(
    {
      required this.id,
      required this.nama_barang,
      required this.deskripsi, 
      required this.img_url,
      required this.harga,
      required this.isBookmark
    }
  );

  factory Aicamzone.fromJson(Map map) {
    return Aicamzone(
      id: map['id'],
      nama_barang: map['nama_barang'],
      img_url: map['img_url'],
      deskripsi: map['deskripsi'],
      harga: map['harga'],
      isBookmark: map['isBookmark']
    );
  }
}