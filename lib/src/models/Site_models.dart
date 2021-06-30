import 'dart:convert';

Site siteFromJson(String str) => Site.fromJson(json.decode(str));
String siteToJson(Site data) => json.encode(data.toJson());

class Site {
  Site({
    required this.name,
    required this.description,
    required this.horario,
    
  });

  String name;
  String description;
  String horario;

  factory Site.fromJson(Map<String, dynamic> json) => Site(
        name: json["name"],
        description: json["description"],
        horario: json["horario"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "horario": horario,
      };
}
