import 'package:go_hookah_app/DTO/main_model_shop_dto.dart';
import 'package:go_hookah_app/models/model_shop.dart';

import '../DTO/model_shop_dto.dart';

extension ShopFromDtoToDomain on MainModelShopDTO {
  MainModelShop toDomain() {
    return MainModelShop(
      result: result?.map((ModelShopDTO e) => e.toDomain()).toList(),
    );
  }
}

extension ShopModelFromDTOToDomain on ModelShopDTO {
  ModelShop toDomain() {
    return ModelShop(
      titlee: titlee,
      idd: idd,
      imagee: imagee,
      addresss: addresss,
      ratee: ratee,
      phonee: phonee,
      descriptionn: descriptionn,
      latt: latt,
      lonn: lonn,
    );
  }
}