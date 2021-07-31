import 'package:flutter/material.dart';

class ItemsMenu extends StatefulWidget {
  ItemsMenu(
      {Key? key,
      required this.title,
      required this.image,
      required this.method})
      : super(key: key);
  final String title;
  final String image;
  final Widget method;

  @override
  _ItemsMenuState createState() => _ItemsMenuState();
}

class _ItemsMenuState extends State<ItemsMenu> {
  _ItemsMenuState();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget.method),
            );
          },
          child: Container(
            margin: EdgeInsets.all(2),
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              image: DecorationImage(
                  image: AssetImage(widget.image), fit: BoxFit.fitWidth),
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).accentColor, //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 3, // blur radius
                  offset: Offset(0, 2), // changes position of shadow
                  //first paramerter of offset is left-right
                  //second parameter is top to down
                ),
                //you can set more BoxShadow() here
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    widget.title,
                    style: TextStyle(
                        letterSpacing: 2,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
