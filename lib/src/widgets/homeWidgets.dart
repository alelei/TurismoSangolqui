import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/list/AtractiveList.dart';
import 'package:turismosangolqui/src/list/Items_Menu.dart';
import 'package:turismosangolqui/src/list/PlacesList.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura:$_heigth");
    return SingleChildScrollView(
      child: Column(
        children: [
          ItemsMenu(
            title: ("Atractivos".toUpperCase()),
            image: ("images/Atractivos.jpg"),
            method: AtractiveList(
              name: Text('Átractivos Turísticos'),
            ),
          ),
          ItemsMenu(
            title: ("Lugares".toUpperCase()),
            image: ("images/Lugares.jpg"),
            method: PlacesList(
              name: Text('Lugares'),
            ),
          ),
          ItemsMenu(
            title: ("Entretenimiento".toUpperCase()),
            image: ("images/Entretenimiento.jpg"),
            method: Text('Atractivos()'),
          ),
          ItemsMenu(
            title: ("Gastronomia".toUpperCase()),
            image: ("images/Gastronomia.jpg"),
            method: Text('Atractivos()'),
          ),
          ItemsMenu(
            title: ("Acerca_de".toUpperCase()),
            image: ("images/Acerca.jpg"),
            method: Text('Atractivos()'),
          ),
        ],
      ),
    );
  }
}
