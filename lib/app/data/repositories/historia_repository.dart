import 'package:get/get.dart';
import 'package:hcduoapp/app/data/models/historia_model.dart';
import 'package:hcduoapp/app/data/providers/historia_provider.dart';

class HistoriaRepository {
  final _apiProvider = Get.find<HistoriaProvider>();

  Future<List<HistoriaModel>> getHistorias({
    required String token,
    required String query,
    required int page,
    required int limit,
  }) =>
      _apiProvider.getHistorias(
          token: token, query: query, page: page, limit: limit);
}
