// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddDataResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDataResponse _$AddDataResponseFromJson(Map<String, dynamic> json) {
  return AddDataResponse(
    message: json['message'] as String,
    code: json['code'] as int,
  );
}

Map<String, dynamic> _$AddDataResponseToJson(AddDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
