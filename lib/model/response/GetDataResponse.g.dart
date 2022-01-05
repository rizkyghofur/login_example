// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetDataResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataResponse _$GetDataResponseFromJson(Map<String, dynamic> json) {
  return GetDataResponse(
    nama_menu: json['nama_menu'] as String,
    foto_menu: json['foto_menu'] as String,
  );
}

Map<String, dynamic> _$GetDataResponseToJson(GetDataResponse instance) =>
    <String, dynamic>{
      'nama_menu': instance.nama_menu,
      'foto_menu': instance.foto_menu,
    };
