import 'package:json_annotation/json_annotation.dart';

part 'AddDataResponse.g.dart';

@JsonSerializable()
class AddDataResponse {
  String message;
  int code;

  AddDataResponse(
      {this.message,
        this.code});

  Map<String, dynamic> toJson() => _$AddDataResponseToJson(this);

  static AddDataResponse fromJson(Map<String, dynamic> json) =>
      _$AddDataResponseFromJson(json);
}