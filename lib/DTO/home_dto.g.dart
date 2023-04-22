// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDTO _$HomeDTOFromJson(Map<String, dynamic> json) => HomeDTO(
      results: (json['data'] as List<dynamic>?)
          ?.map((e) => CardModelDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDTOToJson(HomeDTO instance) => <String, dynamic>{
      'data': instance.results,
    };
