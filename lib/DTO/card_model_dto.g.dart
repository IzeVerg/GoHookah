// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModelDTO _$CardModelDTOFromJson(Map<String, dynamic> json) => CardModelDTO(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      address: json['address'] as String,
      rate: (json['rate'] as num).toDouble(),
      image: json['img'] as String?,
      phone: json['phone'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CardModelDTOToJson(CardModelDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.image,
      'address': instance.address,
      'phone': instance.phone,
      'description': instance.description,
      'rate': instance.rate,
    };
