// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateDataRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateDataRequest _$UpdateDataRequestFromJson(Map<String, dynamic> json) {
  return UpdateDataRequest(
    item_name: json['item_name'] as String,
    item_code: json['item_code'] as String,
    foto_produk: json['foto_produk'] as String,
    stock: json['stock'] as String,
    price: json['price'] as String,
  );
}

Map<String, dynamic> _$UpdateDataRequestToJson(UpdateDataRequest instance) =>
    <String, dynamic>{
      'item_name': instance.item_name,
      'item_code': instance.item_code,
      'foto_produk': instance.foto_produk,
      'stock': instance.stock,
      'price': instance.price,
    };
