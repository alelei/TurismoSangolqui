import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/list/AtractiveList.dart';

class AtractivesWidget extends StatefulWidget {
  const AtractivesWidget({Key? key}) : super(key: key);

  @override
  _AtractivesWidgetState createState() => _AtractivesWidgetState();
}

class _AtractivesWidgetState extends State<AtractivesWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: AtractiveList(name: Text('Atractivos Turísticos'),));
  }
}
