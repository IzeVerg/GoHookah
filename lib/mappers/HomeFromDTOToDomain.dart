import '../DTO/card_model_dto.dart';
import '../DTO/home_dto.dart';
import '../models/modal.dart';

extension HomefromDTOToDomain on HomeDTO {
  MainCardModel toDomain() {
    return MainCardModel(
      data: data?.map((CardModelDTO e) =>  e.toDomain()).toList(),
    );
  }
}

extension CardModelFromDTOToDomain on CardModelDTO{
  CardModel toDomain() {
    return CardModel(
      title: title,
      id: id,
      image: image,
      address: address,
      rate: rate,
      phone: phone,
      description: description,
    );
  }
}