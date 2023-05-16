import 'package:dio/dio.dart';
import 'package:go_hookah_app/DTO/model_shop_dto.dart';
import 'package:go_hookah_app/dialogs/error_dialog.dart';
import 'package:go_hookah_app/mappers/shop_from_dto_to_domain.dart';
import 'package:go_hookah_app/mini-moments/button.dart';
import 'package:go_hookah_app/models/model_shop.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ShopRepository {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

  static Future<MainModelShop?> loadData(context) async {
    try {
      //Выполняем запрос
      const String url = ShopQuery.basesUrl;
      final Response<dynamic> response =
      await _dio.get<Map<dynamic, dynamic>>(url);

      //парсим ДТО
      final responsesMap = response.data as Map<String, dynamic>;
      final List<ModelShopDTO> responseList = List<ModelShopDTO>.from(
        (responsesMap["data"] as List? ?? []).map(
              (card) => ModelShopDTO.fromJson(card),
        ),
      ).whereType<ModelShopDTO>().toList();

      //Конвертируем ДТО в модели
      final modelShops = <ModelShop>[];
      for (final dto in responseList) {
        modelShops.add(dto.toDomain());
      }

      //Собираем модели карточек фильмов и возвращаем единую модель
      final MainModelShop model = MainModelShop(result: modelShops);
      return model;
    } on DioError catch (error) {
      final statusCode = error.response?.statusCode;
      showErrorDialog(context, error: statusCode?.toString() ?? '');
      return null;
    }
  }
}