
import 'package:json_annotation/json_annotation.dart';

import 'card_model_dto.dart';

part 'home_dto.g.dart';

@JsonSerializable()
class HomeDTO {
  @JsonKey(name : "data")
  final List<CardModelDTO>? data;

  HomeDTO({this.data});

  factory HomeDTO.fromJson(Map<String, dynamic> json) =>
      _$HomeDTOFromJson(json);
}