import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:turismosangolqui/src/pages/favorite_element_page.dart';
import 'package:turismosangolqui/src/widgets/content/Reservation_user_widget.dart';
import 'package:turismosangolqui/src/widgets/homeWidgets.dart';

class ItemMenu {
  String label;
  IconData icon;
  ItemMenu(this.icon, this.label);
  ItemMenu.create(this.icon, this.label);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home, "Inicio"),
  ItemMenu.create(Icons.people, "Mis Reservas"),
  ItemMenu.create(Icons.people, "Sitios Favoritos"),

];
List<ItemMenu> settingsOptions = [
  ItemMenu(Icons.settings, "Configuración"),
  ItemMenu(Icons.supervised_user_circle, "Créditos")
];


List<Widget> contentWidget = [HomeWidget(), ReservationUserWidget(),FavoriteElementPage()];

GeoReference geoReferenceFromJson(String str) =>
    GeoReference.fromJson(json.decode(str));

String geoReferenceToJson(GeoReference data) => json.encode(data.toJson());

class GeoReference {
  GeoReference({
    required this.lat,
    required this.lng,
  });

  double lat;
  double lng;

  factory GeoReference.fromJson(Map<String, dynamic> json) => GeoReference(
        lat: json["_latitude"],
        lng: json["_longitude"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };

  LatLng getGeo() {
    return LatLng(lat, lng);
  }
}
