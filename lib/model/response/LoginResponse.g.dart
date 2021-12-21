// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    id: json['id'] as String,
    success: json['success'] as String,
    username: json['username'] as String,
    role: json['role'] as String,
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'id': instance.id,
      'username': instance.username,
      'role': instance.role,
    };
