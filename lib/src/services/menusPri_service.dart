import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:turismosangolqui/src/models/MenuPri_models.dart';

class MenusPriService {
  MenusPriService();

  Future<List<MenuPri>> getMenusPri() async =>
      rootBundle.loadString("assets/data/main_items.json").then((data) {
        List<MenuPri> items = [];
        List<dynamic> jsonList = json.decode(data);
        for (var item in jsonList) {
          final type = new MenuPri.fromJson(item);
          items.add(type);
        }
        return items;
      });
}
