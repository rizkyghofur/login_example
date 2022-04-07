import 'package:json_annotation/json_annotation.dart';
import 'package:login_example/model/response/LoginDetailResponse.dart';

part 'LoginResponse.g.dart';

@JsonSerializable()
class LoginResponse {
  String success;
  String message;
  LoginDetailResponse data;

  LoginResponse({this.success, this.message, this.data});

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  static LoginResponse fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
