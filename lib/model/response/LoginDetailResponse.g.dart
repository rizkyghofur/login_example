// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginDetailResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDetailResponse _$LoginDetailResponseFromJson(Map<String, dynamic> json) {
  return LoginDetailResponse(
    success: json['success'] as String,
    message: json['message'] as String,
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$LoginDetailResponseToJson(
        LoginDetailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
