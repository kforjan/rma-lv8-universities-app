import 'package:rma_lv8_universities_app/data/network/rest_client.dart';
import 'package:rma_lv8_universities_app/models/university.dart';

class UniversityApi {
  UniversityApi(this._restClient);

  final RestClient _restClient;

  Future<List<University>> getUniversities() async {
    try {
      final List<dynamic> response = await _restClient
          .get('http://universities.hipolabs.com/search?country=croatia');
      final universities = <University>[];
      response.forEach((element) {
        universities.add(University.fromJson(element));
      });
      return universities;
    } catch (e) {
      throw e;
    }
  }
}
