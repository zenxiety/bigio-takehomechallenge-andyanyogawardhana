import 'package:dio/dio.dart';
import 'package:takehomechallenge_andyanyogawardhana/models/characters_model.dart';
import 'package:takehomechallenge_andyanyogawardhana/utils/constants/url.dart';

class CharacterServices {
  static final _dio = Dio();

  static Future<CharactersModel> getCharacters({required int page}) async {
    try {
      final String url = "${Url.baseUrl}/character/?page=$page";

      final response = await _dio.get(url);

      return CharactersModel.fromJson(response.data);
    } on DioException catch (_) {
      rethrow;
    }
  }
}
