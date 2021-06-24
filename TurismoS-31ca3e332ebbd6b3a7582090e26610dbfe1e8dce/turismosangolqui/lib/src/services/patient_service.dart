import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:turismosangolqui/src/models/MenuPri_models.dart';


class MenuPriService {
  MenuPriService();

  //Future, indica que es una llama asíncrona
  Future<List<MenuPri>> getMenuPri() async {
    List<MenuPri> items = [];
    try {
      
      var uri = Uri.https(
          "us-central1-espe-track-medical.cloudfunctions.net", "/api/api/items_menu/1/10");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final menu = new MenuPri.fromJson(item);
        items.add(menu);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
}
