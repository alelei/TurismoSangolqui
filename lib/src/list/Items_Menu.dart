import 'package:flutter/material.dart';

class ItemsMenu extends StatefulWidget {
  ItemsMenu(
      {Key? key,
      required this.title,
      required this.image,
      required this.method})
      : super(key: key);
  final Widget title;
  final Widget image;
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
                MaterialPageRoute(
                  builder: (context) => 
                  SingleChildScrollView(child: widget.method)),
                );
          },
          child: Container(
            
            child: Card(
              child: Column(
                children: <Widget>[widget.title, widget.image],
              ),
            ),
          ),
        )
      ],
    );
  }
}
