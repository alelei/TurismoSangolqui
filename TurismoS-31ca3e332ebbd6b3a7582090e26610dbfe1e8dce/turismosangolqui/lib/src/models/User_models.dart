import 'dart:convert';


import 'package:turismosangolqui/src/models/Reservation_models.dart';
import 'package:turismosangolqui/src/models/Site_models.dart';


User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.name,
    required this.surname,
    this.placeOfBirth,
    required this.dateOfBirth,
    this.site,
    this.reservation,
    required this.email,
    required this.pass,
  });

  String name;
  String surname;
  String? placeOfBirth;
  DateTime dateOfBirth;
  String email;
  String pass;
  List<Site>? site;
  List<Reservation>? reservation;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        surname: json["surname"],
        placeOfBirth: json["placeOfBirth"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        email: json["email"],
        pass: json["pass"],
        site: List<Site>.from(
            json["site"].map((x) => Site.fromJson(x))),
        reservation: List<Reservation>.from(
            json["reservation"].map((x) => Reservation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "surname": surname,
        "placeOfBirth": placeOfBirth,
        "dateOfBirth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "email": email,
        "pass": pass,
        "site": List<dynamic>.from(site!.map((x) => x.toJson())),
        "reservation": List<dynamic>.from(reservation!.map((x) => x.toJson())),

      };
}
