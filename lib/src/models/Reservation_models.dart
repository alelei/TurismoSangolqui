import 'dart:convert';

Reservation reservationFromJson(String str) =>
    Reservation.fromJson(json.decode(str));
String reservationToJson(Reservation data) => json.encode(data.toJson());

class Reservation {
  Reservation({
    required this.name,
    required this.photo,
    required this.horario,
    required this.description,
    required this.price,

    // ignore: non_constant_identifier_names
  });

  String name;
  String photo;
  String horario;
  String description;
  String price;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        name: json["name"],
        photo: json["photo"],
        horario: json["horario"],
        description: json["description"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
        "horario": horario,
        "description": description,
        "price": price,
      };
}
