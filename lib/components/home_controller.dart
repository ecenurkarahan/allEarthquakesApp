import 'dart:convert';
import 'package:all_earthquakes_app/models/earthquakes_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../network/api_client.dart';

class HomeController extends ChangeNotifier {
  Client httpClient = Client();
  late ApiClient apiClient;
  EarthquakesModel? earthquakesModel;

  init() {
    apiClient = ApiClient(httpClient: httpClient);
    fetchEarthquakesInfo();
  }

  void fetchEarthquakesInfo() async {
    await apiClient.get("14.599512","120.984222").then((response) {
      if(response != null) {
        Logger().i('Response: ${response.body}');
        Map<String, dynamic> body = jsonDecode(response.body);
        earthquakesModel = EarthquakesModel.fromJson(body);
        Logger().d('Location: ${earthquakesModel!.data![0].location}');
        notifyListeners();
      } else {
        Logger().e('Failed to fetch earthquake info.');
      }
    });

  }
}