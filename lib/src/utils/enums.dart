import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/widgets/homeWidgets.dart';
import 'package:turismosangolqui/src/widgets/reservaWidgets.dart';


class ItemMenu {
  String label;
  IconData icon;
  ItemMenu(this.icon, this.label);
  ItemMenu.create(this.icon, this.label);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home, "Inicio"),
  ItemMenu.create(Icons.people, "Reservas"),
  
];

List<Widget> contentWidget = [HomeWidget(), reservaWidgets()];