import 'package:json_annotation/json_annotation.dart';

part 'LoginResponse.g.dart';

@JsonSerializable()
class LoginResponse {
  String success;
  String message;
  int id;
  String nama;
  String email;
  String notelp;
  String role;

  LoginResponse(
      {this.success,
      this.message,
      this.id,
      this.nama,
      this.email,
      this.notelp,
      this.role});

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  static LoginResponse fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
