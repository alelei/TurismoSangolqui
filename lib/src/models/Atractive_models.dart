import 'dart:convert' ;

Atractive atractivesFromJson(String str) => Atractive.fromJson(json.decode(str));
String atractivesToJson(Atractive data) => json.encode(data.toJson());

class Atractive {
  Atractive({
    
    required this.name,
    required this.description,
    required this.horario,
    this.photo,
    
  });
  static const String collectionId = 'atractive';


  String name;
  String description;
  String horario;
  String? photo;
  

  factory Atractive.fromJson(Map<String, dynamic> json) => Atractive(
       
        name: json["name"],
        description: json["description"],
        horario: json["horario"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        
        "name": name,
        "description": description,
        "horario": horario,
        "photo":photo,
      };
}
