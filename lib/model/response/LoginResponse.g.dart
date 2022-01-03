// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    success: json['success'] as String,
    message: json['message'] as String,
    id: json['id'] as int,
    nama: json['nama'] as String,
    email: json['email'] as String,
    notelp: json['notelp'] as String,
    role: json['role'] as String,
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'id': instance.id,
      'nama': instance.nama,
      'email': instance.email,
      'notelp': instance.notelp,
      'role': instance.role,
    };
