import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Place_models.dart';
import 'package:turismosangolqui/src/services/places_service.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';
import 'package:turismosangolqui/src/widgets/cards/PlacesCard.dart';

class PlacesList extends StatefulWidget {
  const PlacesList({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _PlacesListState createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {
  final PlaceService _service = PlaceService();
  List<Place> _place = [];

  @override
  void initState() {
    super.initState();
    _loadPlace();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        child: Column(
          children: [
            Card(
                child: _place.length == 0
                    ? Center(
                        child: Container(
                          child: Center(child: Text('Descargando Items')),
                        ),
                      )
                    : Container(
                        child: Column(
                            // mainAxisAlignment : MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: _place
                                .map((e) => PlaceCard(currentPlace: e))
                                .toList())))
          ],
        ),
      ),
    );
  }

  _loadPlace() {
    _service.getPlaces().then((value) {
      _place = value;
      setState(() {});
    });
  }
}
