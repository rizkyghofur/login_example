// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateDataRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateDataRequest _$UpdateDataRequestFromJson(Map<String, dynamic> json) {
  return UpdateDataRequest(
    nama_menu: json['nama_menu'] as String,
    deskripsi_menu: json['deskripsi_menu'] as String,
    harga: json['harga'] as int,
    diskon: json['diskon'] as int,
  );
}

Map<String, dynamic> _$UpdateDataRequestToJson(UpdateDataRequest instance) =>
    <String, dynamic>{
      'nama_menu': instance.nama_menu,
      'deskripsi_menu': instance.deskripsi_menu,
      'harga': instance.harga,
      'diskon': instance.diskon,
    };
