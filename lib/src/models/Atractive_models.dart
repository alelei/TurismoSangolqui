import 'dart:convert' ;

import 'package:turismosangolqui/src/utils/enums.dart';

Atractive atractivesFromJson(String str) => Atractive.fromJson(json.decode(str));
String atractivesToJson(Atractive data) => json.encode(data.toJson());

class Atractive {
  Atractive({
    
    required this.name,
    required this.description,
    required this.horario,
    this.photo,
     this.georeference
    
  });
  
Atractive.create(this.name, this.description, this.horario);

  String name;
  String description;
  String horario;
  String? photo;
   GeoReference? georeference;
  

  factory Atractive.fromJson(Map<String, dynamic> json) => Atractive(
       
        name: json["name"],
        description: json["description"],
        horario: json["horario"],
        photo: json["photo"],
        georeference: json["georeference"] == null
          ? null
          : GeoReference.fromJson(json["georeference"]));
      

  Map<String, dynamic> toJson() => {
        
        "name": name,
        "description": description,
        "horario": horario,
        "photo":photo,
      };
}
