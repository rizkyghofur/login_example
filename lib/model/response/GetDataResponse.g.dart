// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetDataResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDataResponse _$GetDataResponseFromJson(Map<String, dynamic> json) {
  return GetDataResponse(
    id: json['id'] as int,
    nama_menu: json['nama_menu'] as String,
    jenis: json['jenis'] as String,
    foto_menu: json['foto_menu'] as String,
    deskripsi_menu: json['deskripsi_menu'] as String,
    harga: json['harga'] as int,
    diskon: json['diskon'] as int,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$GetDataResponseToJson(GetDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_menu': instance.nama_menu,
      'jenis': instance.jenis,
      'foto_menu': instance.foto_menu,
      'deskripsi_menu': instance.deskripsi_menu,
      'harga': instance.harga,
      'diskon': instance.diskon,
      'status': instance.status,
    };
