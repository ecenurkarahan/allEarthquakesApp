import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiClient {
  final String baseUrl = "https://everyearthquake.p.rapidapi.com";
  final String endPoint = "current.json";
  final http.Client httpClient;

  ApiClient({required this.httpClient});

  Future<http.Response?> get(String coordinate) async {
    final response = await httpClient.get(
        Uri.parse('$baseUrl/$endPoint?q=$coordinate'),
        headers: {"X-RapidAPI-Key": "01a72cdb43msh7737b05393ee79bp1ff760jsn48be3899c1ea"});
    if (response.statusCode != 200) {
      Logger().e('Request failed with status: ${response.statusCode}.');
      return null;
    } else {
      Logger().i('Request successful with status: ${response.statusCode}.');
      return response;
    }
  }
}