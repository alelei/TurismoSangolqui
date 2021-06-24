import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/list/menuList.dart';



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

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("", style: Theme.of(context).textTheme.bodyText1),          //Etilos 
          Text("", style: Theme.of(context).textTheme.bodyText1),
          Expanded(child: SingleChildScrollView(child: menusList()))
        ],
      ),
    );
  }
}
