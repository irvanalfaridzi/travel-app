import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:travel_app/models/trips.dart';
import 'package:travel_app/services/api_constants.dart';

class ApiService {
  static Future<List<Trips>?> getTrips() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.tripsEndpoint);
      log("request trips");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Trips> model = tripsFromJson(response.body);
        await Future.delayed(const Duration(seconds: 3));
        log(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
