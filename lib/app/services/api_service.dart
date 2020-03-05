import 'package:http/http.dart' as http;
import 'package:coronavirus_rest_api_flutter_course/app/services/api.dart';

class APIService {
  APIService(this.api);
  final API api;

  Future<String> getAccessToken() async {
    final response = await http.post(
      api.tokenUri().toString(),
      headers: {'Authorization': 'Basic ${api.apiKey}'},
    );
  }
}
