import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/list/AtractiveList.dart';
import 'package:turismosangolqui/src/list/Items_Menu.dart';
import 'package:turismosangolqui/src/list/atractiveListCard.dart';
import 'package:turismosangolqui/src/widgets/content/AtractiveWidget.dart';

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
            title: Text("Atractivos"),
            image: Image.asset("images/Atractivos.jpg",
                height: 175,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth),
            method: AtractiveList(
              name: Text('Átractivos Turísticos'),
            ),
          ),
          ItemsMenu(
            title: Text("Lugares"),
            image: Image.asset("images/Lugares.jpg",
                height: 175,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth),
            method: Text('Atractivos()'),
          ),
          ItemsMenu(
            title: Text("Entretenimiento"),
            image: Image.asset("images/Entretenimiento.jpg",
                height: 175,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth),
            method: Text('Atractivos()'),
          ),
          ItemsMenu(
            title: Text("Gastronomia"),
            image: Image.asset("images/Gastronomia.jpg",
                height: 175,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth),
            method: Text('Atractivos()'),
          ),
          ItemsMenu(
            title: Text("Acerca_de"),
            image: Image.asset("images/Atractivos.jpg",
                height: 175,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth),
            method: Text('Atractivos()'),
          ),
        ],
      ),
    );
  }
}
