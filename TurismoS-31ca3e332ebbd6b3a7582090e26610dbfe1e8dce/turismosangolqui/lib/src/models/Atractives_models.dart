import 'dart:convert';

Atractive atractivesFromJson(String str) => Atractive.fromJson(json.decode(str));
String atractivesToJson(Atractive data) => json.encode(data.toJson());

class Atractive {
  Atractive({
    required this.id,
    required this.name,
    required this.description,
    required this.horario,
    this.photo,
    
  });

  String id;
  String name;
  String description;
  String horario;
  String? photo;
  

  factory Atractive.fromJson(Map<String, dynamic> json) => Atractive(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        horario: json["horario"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id":id,
        "name": name,
        "description": description,
        "horario": horario,
        "photo":photo,
      };
}
