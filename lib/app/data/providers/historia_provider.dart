import 'package:dio/dio.dart';
import 'package:hcduoapp/app/core/config/app_config.dart';
import 'package:hcduoapp/app/data/models/historia_model.dart';

class HistoriaProvider {
  Future<List<HistoriaModel>> getHistorias({
    required String token,
    required String query,
    required int page,
    required int limit,
  }) async {
    final _dio = Dio();
    final _response = await _dio.get(
      "$kBaseUrl$version$kKeyHistorias?query=$query&page=$page&limit=$limit",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
    print("_response.data: ${_response.data}");
    return (_response.data as List)
        .map((json) => HistoriaModel.fromJson(json))
        .toList();
  }
}
