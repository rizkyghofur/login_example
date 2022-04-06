import 'package:json_annotation/json_annotation.dart';

part 'GetBiodataResponse.g.dart';

@JsonSerializable()
class GetBiodataResponse {
  int id;
  String sosmed1;
  String sosmed2;
  String sosmed3;
  String total_projek;
  String alamat;
  String pekerjaan;
  String link_sosmed1;
  String link_sosmed2;
  String link_sosmed3;
  String deskripsi_profil;
  String foto_profil;

  GetBiodataResponse(
      {this.id,
      this.sosmed1,
      this.sosmed2,
      this.sosmed3,
      this.alamat,
      this.pekerjaan,
      this.link_sosmed1,
      this.link_sosmed2,
      this.link_sosmed3,
      this.deskripsi_profil,
      this.foto_profil});

  Map<String, dynamic> toJson() => _$GetBiodataResponseToJson(this);

  static GetBiodataResponse fromJson(Map<String, dynamic> json) =>
      _$GetBiodataResponseFromJson(json);
}
