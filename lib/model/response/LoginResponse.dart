import 'package:json_annotation/json_annotation.dart';

part 'LoginResponse.g.dart';

@JsonSerializable()
class LoginResponse {
  String token;

  LoginResponse({this.token});

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  static LoginResponse fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
