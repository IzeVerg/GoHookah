
import 'package:json_annotation/json_annotation.dart';

import 'model_shop_dto.dart';

part 'main_model_shop_dto.g.dart';

@JsonSerializable()
class MainModelShopDTO {
  @JsonKey(name : "data")
  final List<ModelShopDTO>? result;

  MainModelShopDTO({this.result});

  factory MainModelShopDTO.fromJson(Map<String, dynamic> json) =>
      _$MainModelShopDTOFromJson(json);
}