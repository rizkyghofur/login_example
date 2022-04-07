import 'package:json_annotation/json_annotation.dart';

part 'LoginDetailResponse.g.dart';

@JsonSerializable()
class LoginDetailResponse {
  String success;
  String message;
  int id;
  String name;
  String email;

  LoginDetailResponse(
      {this.success, this.message, this.id, this.name, this.email});

  Map<String, dynamic> toJson() => _$LoginDetailResponseToJson(this);

  static LoginDetailResponse fromJson(Map<String, dynamic> json) =>
      _$LoginDetailResponseFromJson(json);
}
