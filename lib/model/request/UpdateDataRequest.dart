import 'package:json_annotation/json_annotation.dart';

part 'UpdateDataRequest.g.dart';

@JsonSerializable()
class UpdateDataRequest {
  String item_name;
  String item_code;
  String foto_produk;
  String stock;
  String price;

  UpdateDataRequest(
      {this.item_name,
      this.item_code,
      this.foto_produk,
      this.stock,
      this.price});

  Map<String, dynamic> toJson() => _$UpdateDataRequestToJson(this);

  static UpdateDataRequest fromJson(Map<String, dynamic> json) =>
      _$UpdateDataRequestFromJson(json);
}
