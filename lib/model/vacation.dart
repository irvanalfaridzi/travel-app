part of 'models.dart';

class Vacation {
  String vacationName;
  String urlImage;
  String location;

  Vacation({
    required this.vacationName,
    required this.urlImage,
    required this.location,
  });
}

List<Vacation> dummyVacation = [
  Vacation(
    vacationName: "Ijen Lake",
    urlImage: "assets/images/vacation-1.png",
    location: "Banyuwangi,\nJawa Timur",
  ),
  Vacation(
    vacationName: "Mount Bromo",
    urlImage: "assets/images/vacation-2.png",
    location: "Lumajang,\nJawa Timur",
  ),
  Vacation(
    vacationName: "Ijen Lake 2",
    urlImage: "assets/images/vacation-1.png",
    location: "Banyuwangi,\nJawa Timur",
  ),
  Vacation(
    vacationName: "Mount Bromo 2",
    urlImage: "assets/images/vacation-2.png",
    location: "Lumajang,\nJawa Timur",
  ),
  Vacation(
    vacationName: "Ijen Lake 3",
    urlImage: "assets/images/vacation-1.png",
    location: "Banyuwangi,\nJawa Timur",
  ),
  Vacation(
    vacationName: "Mount Bromo 3",
    urlImage: "assets/images/vacation-2.png",
    location: "Lumajang,\nJawa Timur",
  ),
];
