import 'package:json_annotation/json_annotation.dart';

part 'AddDataRequest.g.dart';

@JsonSerializable()
class AddDataRequest {
  String nama_menu;
  String deskripsi_menu;
  int harga;
  int diskon;
  String jenis;
  String status;
  String foto_menu;

  AddDataRequest({this.nama_menu, this.deskripsi_menu, this.harga, this.diskon, this.jenis, this.status, this.foto_menu});

  Map<String, dynamic> toJson() => _$AddDataRequestToJson(this);

  static AddDataRequest fromJson(Map<String, dynamic> json) =>
      _$AddDataRequestFromJson(json);
}