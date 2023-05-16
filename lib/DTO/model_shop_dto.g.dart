// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_shop_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelShopDTO _$ModelShopDTOFromJson(Map<String, dynamic> json) => ModelShopDTO(
      idd: json['id'] as int?,
      titlee: json['title'] as String?,
      addresss: json['address'] as String?,
      ratee: (json['rate'] as num?)?.toDouble(),
      imagee: json['img'] as String?,
      phonee: json['phone'] as String?,
      descriptionn: json['description'] as String?,
      lonn: json['lon'] as String,
      latt: json['lat'] as String,
    );

Map<String, dynamic> _$ModelShopDTOToJson(ModelShopDTO instance) =>
    <String, dynamic>{
      'id': instance.idd,
      'title': instance.titlee,
      'img': instance.imagee,
      'address': instance.addresss,
      'phone': instance.phonee,
      'description': instance.descriptionn,
      'rate': instance.ratee,
      'lat': instance.latt,
      'lon': instance.lonn,
    };
