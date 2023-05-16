import 'package:json_annotation/json_annotation.dart';

part 'card_model_dto.g.dart';

@JsonSerializable()
class CardModelDTO {
  CardModelDTO({
    this.id,
    this.title,
    this.address,
    this.rate,
    this.image,
    this.phone,
    this.description,
    required this.lat,
    required this.lon,
});

   factory CardModelDTO.fromJson(Map<String, dynamic> json) =>
   _$CardModelDTOFromJson(json);

   @JsonKey(name: "id")
   final int? id;

   @JsonKey(name: "title")
   final String? title;

   @JsonKey(name: "img")
   final String? image;

   @JsonKey(name: "address")
   final String? address;

   @JsonKey(name: "phone")
   final String? phone;

   @JsonKey(name: "description")
   final String? description;

   @JsonKey(name: "rate")
   final double? rate;

   @JsonKey(name: "lat")
   final String lat;

   @JsonKey(name: "lon")
   final String lon;
}