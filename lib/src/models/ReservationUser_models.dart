import 'dart:convert';


ReservationUser reservationFromJson(String str) =>
    ReservationUser.fromJson(json.decode(str));
String reservationToJson(ReservationUser data) => json.encode(data.toJson());

class ReservationUser {
  ReservationUser(
      {required this.photo,
      required this.name,
      this.description,
      // ignore: non_constant_identifier_names
      required this.number_childrens,
      // ignore: non_constant_identifier_names
      required this.number_adults,
      required this.price,
      this.days,
      required this.pago,

      // ignore: non_constant_identifier_names
      required this.fecha_ingreso,
      // ignore: non_constant_identifier_names
      required this.fecha_Salida});
  String photo;
  String price;
  String? days;
  String pago;
  String name;

  String? description;
  // ignore: non_constant_identifier_names
  String number_childrens;
  // ignore: non_constant_identifier_names
  String number_adults;

  // ignore: non_constant_identifier_names
  DateTime fecha_ingreso;
  // ignore: non_constant_identifier_names
  DateTime fecha_Salida;

  ReservationUser.create(
      this.photo,
      this.name,
      this.description,
      this.number_childrens,
      this.number_adults,
      this.fecha_Salida,
      this.fecha_ingreso,
      this.days,
      this.pago,
      this.price,
      );

  factory ReservationUser.fromJson(Map<String, dynamic> json) =>
      ReservationUser(
        name: json["name"],
        photo: json["photo"],
        // horario: json["horario"],
        description: json["description"],
        price: json["price"],
        fecha_ingreso: DateTime.parse(json["fecha_ingreso"]),
        fecha_Salida: DateTime.parse(json["fecha_Salida"]),
        pago: json["pago"],
        number_childrens: json["number_childrens"],
        number_adults: json["number_adults"],
        days: json["days"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "number_childrens": number_childrens,
        "number_adults": number_adults,
        "price": price,
        "days": days,
        "pago": pago,
        "photo": photo,
        "fecha_ingreso":
            "${fecha_ingreso.year.toString().padLeft(4, '0')}-${fecha_ingreso.month.toString().padLeft(2, '0')}-${fecha_ingreso.day.toString().padLeft(2, '0')}",
        "fecha_Salida":
            "${fecha_Salida.year.toString().padLeft(4, '0')}-${fecha_Salida.month.toString().padLeft(2, '0')}-${fecha_Salida.day.toString().padLeft(2, '0')}",
      };
}
