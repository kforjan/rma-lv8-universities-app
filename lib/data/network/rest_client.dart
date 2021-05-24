import 'package:http/http.dart' as http;

class RestClient {
  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(url));
    final resBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 400) {
      throw Exception();
    }
    return resBody;
  }
}
