import 'dart:convert';

MenuPri menuPriFromJson(String str) => MenuPri.fromJson(json.decode(str));
String menuPriToJson(MenuPri data) => json.encode(data.toJson());

class MenuPri {
  MenuPri({
    required this.name,
    this.photo,
  });

  String name;
  String? photo;

  factory MenuPri.fromJson(Map<String, dynamic> json) => MenuPri(
        name: json["name"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
      };
}
