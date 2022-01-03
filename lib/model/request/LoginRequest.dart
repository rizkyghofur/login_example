import 'package:json_annotation/json_annotation.dart';

part 'LoginRequest.g.dart';

@JsonSerializable()
class LoginRequest {
  String email;
  String password;
  String role;

  LoginRequest({this.email, this.password, this.role});

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  static LoginRequest fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}
