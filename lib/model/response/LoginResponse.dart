import 'package:json_annotation/json_annotation.dart';

part 'LoginResponse.g.dart';
@JsonSerializable()
class LoginResponse {
  String success;
  String id;
  String username;
  String role;

  LoginResponse({this.id, this.success, this.username, this.role});

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  static LoginResponse fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}