import 'package:flutter/material.dart';
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

List<Widget> contentWidget = [HomeWidget(), ReservationUserWidget(),FavoriteElementPage()];
