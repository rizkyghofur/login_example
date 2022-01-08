// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateDataResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateDataResponse _$UpdateDataResponseFromJson(Map<String, dynamic> json) {
  return UpdateDataResponse(
    message: json['message'] as String,
    code: json['code'] as int,
  );
}

Map<String, dynamic> _$UpdateDataResponseToJson(UpdateDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
