import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/list/AtractiveList.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';

class AtractivesWidget extends StatefulWidget {
  const AtractivesWidget({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _AtractivesWidgetState createState() => _AtractivesWidgetState();
}

class _AtractivesWidgetState extends State<AtractivesWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Standard.appBar(
            context,
            ListTile(
              title: Standard.titleToForm(
                  context, widget.name.toUpperCase(), TextAlign.center),
            )),
        body: SingleChildScrollView(
          child: AtractiveList(),
        ));
  }
}
