// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddDataRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDataRequest _$AddDataRequestFromJson(Map<String, dynamic> json) {
  return AddDataRequest(
    nama_menu: json['nama_menu'] as String,
    deskripsi_menu: json['deskripsi_menu'] as String,
    harga: json['harga'] as int,
    diskon: json['diskon'] as int,
    jenis: json['jenis'] as String,
    status: json['status'] as String,
    foto_menu: json['foto_menu'] as String,
  );
}

Map<String, dynamic> _$AddDataRequestToJson(AddDataRequest instance) =>
    <String, dynamic>{
      'nama_menu': instance.nama_menu,
      'deskripsi_menu': instance.deskripsi_menu,
      'harga': instance.harga,
      'diskon': instance.diskon,
      'jenis': instance.jenis,
      'status': instance.status,
      'foto_menu': instance.foto_menu,
    };
