// To parse this JSON data, do
//
//     final trips = tripsFromJson(jsonString);

import 'dart:convert';

List<Trips> tripsFromJson(String str) =>
    List<Trips>.from(json.decode(str).map((x) => Trips.fromJson(x)));

String tripsToJson(List<Trips> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trips {
  Trips({
    required this.id,
    required this.destinationName,
    required this.destinationCity,
    required this.destinationRegion,
    required this.destinationCountry,
    required this.minimumPerson,
    required this.price,
    required this.rating,
    required this.photoCover,
  });

  int id;
  String destinationName;
  String destinationCity;
  String destinationRegion;
  String destinationCountry;
  String minimumPerson;
  int price;
  double rating;
  String photoCover;

  String get location =>
      "$destinationCity, $destinationRegion, $destinationCountry";
  String get person => int.parse(minimumPerson) > 1 ? "persons" : "person";

  factory Trips.fromJson(Map<String, dynamic> json) => Trips(
        id: json["id"],
        destinationName: json["destination_name"],
        destinationCity: json["destination_city"],
        destinationRegion: json["destination_region"],
        destinationCountry: json["destination_country"],
        minimumPerson: json["minimum_person"],
        price: json["price"],
        rating: json["rating"]?.toDouble(),
        photoCover: json["photo_cover"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "destination_name": destinationName,
        "destination_city": destinationCity,
        "destination_region": destinationRegion,
        "destination_country": destinationCountry,
        "minimum_person": minimumPerson,
        "price": price,
        "rating": rating,
        "photo_cover": photoCover,
      };
}
