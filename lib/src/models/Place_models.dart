import 'dart:convert';

Place placeFromJson(String str) => Place.fromJson(json.decode(str));
String placeToJson(Place data) => json.encode(data.toJson());

class Place {
  Place({
    this.name,
    this.photo,
    this.method,
    this.horario,
  });

  String? name;
  String? photo;
  String? method;
  String? horario;
  factory Place.fromJson(Map<String, dynamic> json) => Place(
        name: json["name"],
        photo: json["photo"],
        method: json["method"],
        horario: json['horario'],
      );

  Map<String, dynamic> toJson() =>
      {"name": name, "photo": photo, "method": method, "horario": horario};
}
