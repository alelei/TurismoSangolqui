import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Atractives_models.dart';
import 'package:turismosangolqui/src/services/atractives_service.dart';

class AtractiveList extends StatefulWidget {
  const AtractiveList({Key? key}) : super(key: key);

  @override
  _AtractiveListState createState() => _AtractiveListState();
}

class _AtractiveListState extends State<AtractiveList> {
  final AtractiveService _service = AtractiveService();
  List<Atractive> _atractive = [];

  @override
  void initState() {
    super.initState();
    _loadAtractive();
  }

  @override
  void dispose() {
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Card(
      child: _atractive.length == 0
          ? Center(
            child: Container(
                child: Center(child: Text('Descargando Items')),
              ),
          )
          : Container(
              child: Column(
                  // mainAxisAlignment : MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children:  _atractive.map((e) => ListTile(
                      title: Text(e.name,
                          style: Theme.of(context).textTheme.headline3),
                      leading: Image.network((e.photo ?? ""),
                      
                          width: 200, height: 200, fit: BoxFit.cover))).toList()
                   ),
                  
                  ),
    );
  }
  _loadAtractive() {
    _service.getAtractive().then((value) {
      _atractive = value;
      setState(() {});
    });
  }
}
