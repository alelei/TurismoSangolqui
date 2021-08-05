import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismosangolqui/src/providers/fisio_elements_provider.dart';

class FavoriteElementList extends StatefulWidget {
  FavoriteElementList({Key? key}) : super(key: key);

  @override
  _FavoriteElementListState createState() => _FavoriteElementListState();
}

class _FavoriteElementListState extends State<FavoriteElementList> {
  @override
  Widget build(BuildContext context) {
    final fisioProvider =
        Provider.of<FisioElementProvider>(context, listen: false);
    fisioProvider.loadElements();

    return fisioProvider.elements.length == 0
        ? Center(
            child: Container(
                height: 100, width: 100, child: CircularProgressIndicator()))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: fisioProvider.elements.length,
            itemBuilder: (_, index) => Card(
                child: Column(
                  children: [
                    ListTile(
                        leading: Icon(Icons.medical_services),
                        title: Text(fisioProvider.elements[index].place_name),
                        subtitle: Text(fisioProvider.elements[index].coment)),
                   ListTile(
                     leading: Icon(Icons.date_range),
                     title: Text('Fecha de Visita'),
                     subtitle: Text(fisioProvider.elements[index].fecha.toString()),
                   )
                  ],
                )));
  }
}
