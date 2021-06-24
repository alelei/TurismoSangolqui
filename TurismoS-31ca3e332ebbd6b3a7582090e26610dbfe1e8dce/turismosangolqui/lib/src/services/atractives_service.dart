import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:turismosangolqui/src/models/Atractives_models.dart';


class AtractiveService {
  AtractiveService();

  //Future, indica que es una llama asíncrona
  Future<List<Atractive>> getAtractive() async {
    List<Atractive> items = [];
    try {
      
      var uri = Uri.https(
          "us-central1-espe-sangolqui-turismo.cloudfunctions.net", "/api/api/atractive/1/10");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final menu = new Atractive.fromJson(item);
        items.add(menu);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
}
