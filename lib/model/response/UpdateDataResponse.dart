import 'package:json_annotation/json_annotation.dart';

part 'UpdateDataResponse.g.dart';

@JsonSerializable()
class UpdateDataResponse {
  String message;
  int code;

  UpdateDataResponse(
      {this.message,
        this.code});

  Map<String, dynamic> toJson() => _$UpdateDataResponseToJson(this);

  static UpdateDataResponse fromJson(Map<String, dynamic> json) =>
      _$UpdateDataResponseFromJson(json);
}