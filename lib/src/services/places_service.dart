import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:turismosangolqui/src/models/Place_models.dart';

class PlaceService {
  PlaceService();

  Future<List<Place>> getPlaces() async =>
      rootBundle.loadString("assets/data/places_items.json").then((data) {
        List<Place> items = [];
        List<dynamic> jsonList = json.decode(data);
        for (var item in jsonList) {
          final type = new Place.fromJson(item);
          items.add(type);
        }
        return items;
      });
}
