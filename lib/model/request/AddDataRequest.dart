import 'package:json_annotation/json_annotation.dart';

part 'AddDataRequest.g.dart';

@JsonSerializable()
class AddDataRequest {
  String item_name;
  String item_code;
  String foto_produk;
  String stock;
  String price;

  AddDataRequest(
      {this.item_name,
      this.item_code,
      this.foto_produk,
      this.stock,
      this.price});

  Map<String, dynamic> toJson() => _$AddDataRequestToJson(this);

  static AddDataRequest fromJson(Map<String, dynamic> json) =>
      _$AddDataRequestFromJson(json);
}
