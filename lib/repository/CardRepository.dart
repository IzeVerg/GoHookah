import 'package:dio/dio.dart';
import 'package:go_hookah_app/DTO/home_dto.dart';
import 'package:go_hookah_app/mappers/HomeFromDTOToDomain.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../DTO/card_model_dto.dart';
import '../dialogs/error_dialog.dart';
import '../mini-moments/button.dart';
import '../models/modal.dart';

class CardRepository {
  static final Dio _dio = Dio()
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ));

  static Future<MainCardModel?> loadData(context) async {
    try {
      //Выполняем запрос
      const String url = CardQuery.baseUrl;
      final Response<dynamic> response =
      await _dio.get<Map<dynamic, dynamic>>(url);

      //парсим ДТО
      final responseMap = response.data as Map<String, dynamic>;
      final List<CardModelDTO> responseList = List<CardModelDTO>.from(
        (responseMap["data"] as List? ?? []).map(
              (card) => CardModelDTO.fromJson(card),
        ),
      ).whereType<CardModelDTO>().toList();

      //Конвертируем ДТО в модели
      final cardsModel = <CardModel>[];
      for (final dto in responseList) {
        cardsModel.add(dto.toDomain());
      }

      //Собираем модели карточек фильмов и возвращаем единую модель
      final MainCardModel model = MainCardModel(results: cardsModel);
      return model;
    } on DioError catch (error) {
      final statusCode = error.response?.statusCode;
      showErrorDialog(context, error: statusCode?.toString() ?? '');
      return null;
    }
  }
}