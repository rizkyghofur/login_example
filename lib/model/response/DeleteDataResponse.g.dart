// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeleteDataResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteDataResponse _$DeleteDataResponseFromJson(Map<String, dynamic> json) {
  return DeleteDataResponse(
    success: json['success'] as String,
    code: json['code'] as int,
  );
}

Map<String, dynamic> _$DeleteDataResponseToJson(DeleteDataResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
    };
