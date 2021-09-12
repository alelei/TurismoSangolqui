
class AtractiveF {
  String description;
  String horario;
  String name;
  String foto;
  String idatv;

  static const String collectionId = 'atractives';
  AtractiveF(
      {required this.description,
      required this.foto,
      required this.horario,
      required this.name,
      required this.idatv
      });

  AtractiveF.fromSnapshot(String idatv,Map<String, dynamic> atractive)
      
      :idatv = idatv,
      description = atractive['description'],
        foto = atractive['foto'],
        horario = atractive['horario'],
        name = atractive['name'];

  Map<String, dynamic> toMap() => {
        'description': description,
        'foto': foto,
        'horario': horario,
        'name': name,
      };

  @override
  String toString() {
    return 'AtractiveF{idatv: $idatv, description: $description, foto: $foto, horario: $horario,name:$name}';
  }
}
