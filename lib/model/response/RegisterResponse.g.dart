// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) {
  return RegisterResponse(
    success: json['success'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
