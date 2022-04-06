// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetBiodataResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBiodataResponse _$GetBiodataResponseFromJson(Map<String, dynamic> json) {
  return GetBiodataResponse(
    id: json['id'] as int,
    sosmed1: json['sosmed1'] as String,
    sosmed2: json['sosmed2'] as String,
    sosmed3: json['sosmed3'] as String,
    alamat: json['alamat'] as String,
    pekerjaan: json['pekerjaan'] as String,
    link_sosmed1: json['link_sosmed1'] as String,
    link_sosmed2: json['link_sosmed2'] as String,
    link_sosmed3: json['link_sosmed3'] as String,
    deskripsi_profil: json['deskripsi_profil'] as String,
    foto_profil: json['foto_profil'] as String,
  )..total_projek = json['total_projek'] as String;
}

Map<String, dynamic> _$GetBiodataResponseToJson(GetBiodataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sosmed1': instance.sosmed1,
      'sosmed2': instance.sosmed2,
      'sosmed3': instance.sosmed3,
      'total_projek': instance.total_projek,
      'alamat': instance.alamat,
      'pekerjaan': instance.pekerjaan,
      'link_sosmed1': instance.link_sosmed1,
      'link_sosmed2': instance.link_sosmed2,
      'link_sosmed3': instance.link_sosmed3,
      'deskripsi_profil': instance.deskripsi_profil,
      'foto_profil': instance.foto_profil,
    };
