
import 'package:json_annotation/json_annotation.dart';

import 'card_model_dto.dart';

part 'home_dto.g.dart';

@JsonSerializable()
class HomeDTO {
  @JsonKey(name : "data")
  final List<CardModelDTO>? results;

  HomeDTO({this.results});

  factory HomeDTO.fromJson(Map<String, dynamic> json) =>
      _$HomeDTOFromJson(json);
}