import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiClient {
  final String baseUrl = "https://everyearthquake.p.rapidapi.com";
  final String endPoint = "recentEarthquakes";
  final http.Client httpClient;

  ApiClient({required this.httpClient});
//recentEarthquakes?interval=P1Y2M3W4DT1H2M3S&start=1&count=100&type=earthquake&latitude=37.7830&longitude=29.0963&radius=1000&units=miles&magnitude=3&intensity=1
  Future<http.Response?> get(String latitude, String longitude) async {
    final response = await httpClient.get(
        Uri.parse('$baseUrl/$endPoint?interval=P1Y2M3W4DT1H2M3S&start=1&count=100&type=earthquake&latitude=$latitude&longitude=$longitude&radius=1000&units=miles&magnitude=3&intensity=1'),
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