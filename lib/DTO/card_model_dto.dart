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
});

   factory CardModelDTO.fromJson(Map<String, dynamic> json) =>
   _$CardModelDTOFromJson(json);

   @JsonKey(name: "id", defaultValue: 0)
   final int? id;

   @JsonKey(name: "title", defaultValue: "")
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
}