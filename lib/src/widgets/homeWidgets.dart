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
            image: ("assets/images/Atractivos.jpg"),
            method: AtractiveList(
              name: Text('Átractivos Turísticos'),
            ),
          ),
          ItemsMenu(
            title: ("Lugares".toUpperCase()),
            image: ("assets/images/Lugares.jpg"),
            method: PlacesList(
              name: Text('Lugares'),
            ),
          ),
          ItemsMenu(
            title: ("Entretenimiento".toUpperCase()),
            image: ("assets/images/Entretenimiento.jpg"),
            method: Text('Atractivos()'),
          ),
          ItemsMenu(
            title: ("Gastronomia".toUpperCase()),
            image: ("assets/images/Gastronomia.jpg"),
            method: Text('Atractivos()'),
          ),
          ItemsMenu(
            title: ("Acerca_de".toUpperCase()),
            image: ("assets/images/Acerca.jpg"),
            method: Text('Atractivos()'),
          ),
        ],
      ),
    );
  }
}
