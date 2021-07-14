import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Place_models.dart';
import 'package:turismosangolqui/src/services/places_service.dart';
import 'package:turismosangolqui/src/widgets/cards/PlacesCard.dart';

class PlacesList extends StatefulWidget {
  const PlacesList({Key? key, required this.name}) : super(key: key);
  final Widget name;
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
    return Column(
      children: [
        AppBar(title: widget.name),
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
    );
  }

  _loadPlace() {
    _service.getPlaces().then((value) {
      _place = value;
      setState(() {});
    });
  }
}
