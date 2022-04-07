import 'package:json_annotation/json_annotation.dart';

part 'RegisterResponse.g.dart';

@JsonSerializable()
class RegisterResponse {
  String message;
  int code;

  RegisterResponse({this.message, this.code});

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  static RegisterResponse fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}
