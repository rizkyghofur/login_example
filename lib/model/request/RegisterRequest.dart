import 'package:json_annotation/json_annotation.dart';

part 'RegisterRequest.g.dart';

@JsonSerializable()
class RegisterRequest {
  String name;
  String email;
  String password;

  RegisterRequest({this.name, this.email, this.password});

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  static RegisterRequest fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
}
