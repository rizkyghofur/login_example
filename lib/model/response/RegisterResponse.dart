import 'package:json_annotation/json_annotation.dart';

part 'RegisterResponse.g.dart';

@JsonSerializable()
class RegisterResponse {
  String success;
  String message;

  RegisterResponse({this.success, this.message});

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  static RegisterResponse fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}
