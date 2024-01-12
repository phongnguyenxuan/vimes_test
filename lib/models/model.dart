// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Model {
    String nguoiLapPhieu;
    String nguoiGiaoHang;
    String thuKho;
    String keToanTruong;
    String donVi;
    String boPhan;
    String nhapTaiKho;
    String so;
    int no;
    int co;
    String diaDiem;
    String tenSanPham;
    String maSo;
    String donViTinh;
    int soLuongCT;
    int soLuongTN;
    int donGia;
    String ngayThangNam;
    int? thanhTien;
  Model({
    required this.nguoiLapPhieu,
    required this.nguoiGiaoHang,
    required this.thuKho,
    required this.keToanTruong,
    required this.donVi,
    required this.boPhan,
    required this.nhapTaiKho,
    required this.so,
    required this.no,
    required this.co,
    required this.diaDiem,
    required this.tenSanPham,
    required this.maSo,
    required this.donViTinh,
    required this.soLuongCT,
    required this.soLuongTN,
    required this.donGia,
    required this.ngayThangNam,
    this.thanhTien,
  });
    

  Model copyWith({
    String? nguoiLapPhieu,
    String? nguoiGiaoHang,
    String? thuKho,
    String? keToanTruong,
    String? donVi,
    String? boPhan,
    String? nhapTaiKho,
    String? so,
    int? no,
    int? co,
    String? diaDiem,
    String? tenSanPham,
    String? maSo,
    String? donViTinh,
    int? soLuongCT,
    int? soLuongTN,
    int? donGia,
    int? thanhTien,
    String? ngayThangNam,
  }) {
    return Model(
      nguoiLapPhieu: nguoiLapPhieu ?? this.nguoiLapPhieu,
      nguoiGiaoHang: nguoiGiaoHang ?? this.nguoiGiaoHang,
      thuKho: thuKho ?? this.thuKho,
      keToanTruong: keToanTruong ?? this.keToanTruong,
      donVi: donVi ?? this.donVi,
      boPhan: boPhan ?? this.boPhan,
      nhapTaiKho: nhapTaiKho ?? this.nhapTaiKho,
      so: so ?? this.so,
      no: no ?? this.no,
      co: co ?? this.co,
      diaDiem: diaDiem ?? this.diaDiem,
      tenSanPham: tenSanPham ?? this.tenSanPham,
      maSo: maSo ?? this.maSo,
      donViTinh: donViTinh ?? this.donViTinh,
      soLuongCT: soLuongCT ?? this.soLuongCT,
      soLuongTN: soLuongTN ?? this.soLuongTN,
      donGia: donGia ?? this.donGia,
      ngayThangNam: ngayThangNam ?? this.ngayThangNam,
      thanhTien: thanhTien ?? (soLuongCT! * donGia!),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nguoiLapPhieu': nguoiLapPhieu,
      'nguoiGiaoHang': nguoiGiaoHang,
      'thuKho': thuKho,
      'keToanTruong': keToanTruong,
      'donVi': donVi,
      'boPhan': boPhan,
      'nhapTaiKho': nhapTaiKho,
      'so': so,
      'no': no,
      'co': co,
      'diaDiem': diaDiem,
      'tenSanPham': tenSanPham,
      'maSo': maSo,
      'donViTinh': donViTinh,
      'soLuongCT': soLuongCT,
      'soLuongTN': soLuongTN,
      'donGia': donGia,
      'ngayThangNam' : ngayThangNam,
      'thanhTien' : (soLuongCT * donGia),
    };
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      nguoiLapPhieu: map['nguoiLapPhieu'] as String,
      nguoiGiaoHang: map['nguoiGiaoHang'] as String,
      thuKho: map['thuKho'] as String,
      keToanTruong: map['keToanTruong'] as String,
      donVi: map['donVi'] as String,
      boPhan: map['boPhan'] as String,
      nhapTaiKho: map['nhapTaiKho'] as String,
      so: map['so'] as String,
      no: map['no'] as int,
      co: map['co'] as int,
      diaDiem: map['diaDiem'] as String,
      tenSanPham: map['tenSanPham'] as String,
      maSo: map['maSo'] as String,
      donViTinh: map['donViTinh'] as String,
      soLuongCT: map['soLuongCT'] as int,
      soLuongTN: map['soLuongTN'] as int,
      ngayThangNam: map['ngayThangNam'] as String,
      donGia: map['donGia'] as int,
      thanhTien: map['thanhTien'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Model.fromJson(String source) => Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Model(nguoiLapPhieu: $nguoiLapPhieu, nguoiGiaoHang: $nguoiGiaoHang, thuKho: $thuKho, keToanTruong: $keToanTruong, donVi: $donVi, boPhan: $boPhan, nhapTaiKho: $nhapTaiKho, so: $so, no: $no, co: $co, diaDiem: $diaDiem, tenSanPham: $tenSanPham, maSo: $maSo, donViTinh: $donViTinh, soLuongCT: $soLuongCT, soLuongTN: $soLuongTN, donGia: $donGia)';
  }

  @override
  bool operator ==(covariant Model other) {
    if (identical(this, other)) return true;
  
    return 
      other.nguoiLapPhieu == nguoiLapPhieu &&
      other.nguoiGiaoHang == nguoiGiaoHang &&
      other.thuKho == thuKho &&
      other.keToanTruong == keToanTruong &&
      other.donVi == donVi &&
      other.boPhan == boPhan &&
      other.nhapTaiKho == nhapTaiKho &&
      other.so == so &&
      other.no == no &&
      other.co == co &&
      other.diaDiem == diaDiem &&
      other.tenSanPham == tenSanPham &&
      other.maSo == maSo &&
      other.donViTinh == donViTinh &&
      other.soLuongCT == soLuongCT &&
      other.soLuongTN == soLuongTN &&
      other.donGia == donGia;
  }

  @override
  int get hashCode {
    return nguoiLapPhieu.hashCode ^
      nguoiGiaoHang.hashCode ^
      thuKho.hashCode ^
      keToanTruong.hashCode ^
      donVi.hashCode ^
      boPhan.hashCode ^
      nhapTaiKho.hashCode ^
      so.hashCode ^
      no.hashCode ^
      co.hashCode ^
      diaDiem.hashCode ^
      tenSanPham.hashCode ^
      maSo.hashCode ^
      donViTinh.hashCode ^
      soLuongCT.hashCode ^
      soLuongTN.hashCode ^
      donGia.hashCode;
  }
}
