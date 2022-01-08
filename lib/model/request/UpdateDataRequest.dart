import 'package:json_annotation/json_annotation.dart';

part 'UpdateDataRequest.g.dart';

@JsonSerializable()
class UpdateDataRequest {
  String nama_menu;
  String deskripsi_menu;
  int harga;
  int diskon;

  UpdateDataRequest({this.nama_menu, this.deskripsi_menu, this.harga, this.diskon});

  Map<String, dynamic> toJson() => _$UpdateDataRequestToJson(this);

  static UpdateDataRequest fromJson(Map<String, dynamic> json) =>
      _$UpdateDataRequestFromJson(json);
}