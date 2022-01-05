import 'package:json_annotation/json_annotation.dart';

part 'GetDataResponse.g.dart';

@JsonSerializable()
class GetDataResponse {
  String nama_menu;
  String foto_menu;

  GetDataResponse(
      {this.nama_menu,
        this.foto_menu});

  Map<String, dynamic> toJson() => _$GetDataResponseToJson(this);
  
  static GetDataResponse fromJson(Map<String, dynamic> json) =>
      _$GetDataResponseFromJson(json);
}
