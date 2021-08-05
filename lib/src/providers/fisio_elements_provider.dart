import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/favorite_element_model.dart';
import 'db_provider.dart';
class FisioElementProvider extends ChangeNotifier {
  List<FavoriteElement> elements = [];

  Future<FavoriteElement> addElement(String place_name, String coment , DateTime fecha) async {
    FavoriteElement element = FavoriteElement(place_name: place_name, coment: coment, fecha: fecha);
    final id = await DBProvider.db.insert(element);
    element.id = id;
    this.elements.add(element);
    notifyListeners();
    return element;
  }

  loadElements() async {
    final travelsQuery = await DBProvider.db.list();
    this.elements = [...travelsQuery];
    notifyListeners();
  }
}
