import 'package:json_annotation/json_annotation.dart';

part 'GetDataResponse.g.dart';

@JsonSerializable()
class GetDataResponse {
  int id;
  String nama_menu;
  String jenis;
  String foto_menu;
  String deskripsi_menu;
  int harga;
  int diskon;
  String status;

  GetDataResponse(
      {this.id,
      this.nama_menu,
      this.jenis,
      this.foto_menu,
      this.deskripsi_menu,
      this.harga,
      this.diskon,
      this.status});

  Map<String, dynamic> toJson() => _$GetDataResponseToJson(this);

  static GetDataResponse fromJson(Map<String, dynamic> json) =>
      _$GetDataResponseFromJson(json);
}
