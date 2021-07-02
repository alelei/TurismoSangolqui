import 'dart:convert';

MenuPri menuPriFromJson(String str) => MenuPri.fromJson(json.decode(str));
String menuPriToJson(MenuPri data) => json.encode(data.toJson());

class MenuPri {
  MenuPri({
    required this.name,
    this.photo,
    required this.method
  });

  String name;
  String? photo;
  String method;

  factory MenuPri.fromJson(Map<String, dynamic> json) => MenuPri(
        name: json["name"],
        photo: json["photo"],
        method: json["method"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
        "method": method
      };
}
