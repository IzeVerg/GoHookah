// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_model_shop_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainModelShopDTO _$MainModelShopDTOFromJson(Map<String, dynamic> json) =>
    MainModelShopDTO(
      result: (json['data'] as List<dynamic>?)
          ?.map((e) => ModelShopDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MainModelShopDTOToJson(MainModelShopDTO instance) =>
    <String, dynamic>{
      'data': instance.result,
    };
