// To parse this JSON data, do
//
//     final fisioElement = fisioElementFromJson(jsonString);

import 'dart:convert';

FavoriteElement fisioElementFromJson(String str) =>
    FavoriteElement.fromJson(json.decode(str));

String fisioElementToJson(FavoriteElement data) => json.encode(data.toJson());

class FavoriteElement {
  FavoriteElement({
    this.id,
    // ignore: non_constant_identifier_names
    required this.place_name,
    required this.coment,
    required this.fecha,
  });

  int? id;
  // ignore: non_constant_identifier_names
  String place_name;
  String coment;
  DateTime fecha;

  FavoriteElement.create(this.place_name, this.coment, this.fecha);

  factory FavoriteElement.fromJson(Map<String, dynamic> json) =>
      FavoriteElement(
        id: json["id"],
        place_name: json["place_name"],
        coment: json["coment"],
        fecha: DateTime.parse(json["fecha"]),

      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "place_name": place_name,
        "coment": coment,
        "fecha": 
            "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}"
      };
}
