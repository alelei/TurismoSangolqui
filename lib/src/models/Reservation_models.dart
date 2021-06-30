import 'dart:convert';

Reservation reservationFromJson(String str) => Reservation.fromJson(json.decode(str));
String reservationToJson(Reservation data) => json.encode(data.toJson());

class Reservation {
  Reservation({
    required this.name,
    required this.detalle,
    required this.horario,
    required this.numperson,
    
  });

  String name;
  String detalle;
  String horario;
  String numperson;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        name: json["name"],
        detalle: json["detalle"],
        horario: json["horario"],
        numperson: json["numperson"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "detalle": detalle,
        "horario": horario,
        "numperson": numperson,
      };
}
