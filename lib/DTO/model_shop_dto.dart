import 'package:json_annotation/json_annotation.dart';

part 'model_shop_dto.g.dart';

@JsonSerializable()
class ModelShopDTO {
  ModelShopDTO({
    this.idd,
    this.titlee,
    this.addresss,
    this.ratee,
    this.imagee,
    this.phonee,
    this.descriptionn,
    required this.lonn,
    required this.latt,
  });

  factory ModelShopDTO.fromJson(Map<String, dynamic> json) =>
      _$ModelShopDTOFromJson(json);

  @JsonKey(name: "id")
  final int? idd;

  @JsonKey(name: "title")
  final String? titlee;

  @JsonKey(name: "img")
  final String? imagee;

  @JsonKey(name: "address")
  final String? addresss;

  @JsonKey(name: "phone")
  final String? phonee;

  @JsonKey(name: "description")
  final String? descriptionn;

  @JsonKey(name: "rate")
  final double? ratee;

  @JsonKey(name: "lat")
  final String latt;

  @JsonKey(name: "lon")
  final String lonn;
}