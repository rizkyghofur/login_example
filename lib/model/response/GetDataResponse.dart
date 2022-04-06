import 'package:json_annotation/json_annotation.dart';

part 'GetDataResponse.g.dart';

@JsonSerializable()
class GetDataResponse {
  int id;
  String item_name;
  String item_code;
  String foto_produk;
  String stock;
  String price;

  GetDataResponse(
      {this.id,
      this.item_name,
      this.item_code,
      this.foto_produk,
      this.stock,
      this.price});

  Map<String, dynamic> toJson() => _$GetDataResponseToJson(this);

  static GetDataResponse fromJson(Map<String, dynamic> json) =>
      _$GetDataResponseFromJson(json);
}
