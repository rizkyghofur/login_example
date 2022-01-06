import 'package:json_annotation/json_annotation.dart';

part 'DeleteDataResponse.g.dart';

@JsonSerializable()
class DeleteDataResponse {
  String success;
  int code;

  DeleteDataResponse(
      {this.success,
        this.code});

  Map<String, dynamic> toJson() => _$DeleteDataResponseToJson(this);

  static DeleteDataResponse fromJson(Map<String, dynamic> json) =>
      _$DeleteDataResponseFromJson(json);
}