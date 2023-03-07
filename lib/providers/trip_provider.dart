import 'package:flutter/material.dart';
import 'package:travel_app/models/trips.dart';
import 'package:travel_app/services/api_service.dart';

class TripProvider with ChangeNotifier {
  late Trips _trips;
  Trips get trips => _trips;

  List<Trips> _listTrip = [];
  List<Trips> get listTrip => _listTrip;

  Future<List<Trips>?> getListTrip() async {
    try {
      if (listTrip.isEmpty) {
        _listTrip = await ApiService.getTrips() ?? [];
      }
    } catch (e) {
      print(e);
    }
    return listTrip;
  }
}
