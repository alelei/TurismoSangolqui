
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:turismosangolqui/src/list/Items_Menu.dart';
import 'package:turismosangolqui/src/list/PlacesList.dart';
import 'package:turismosangolqui/src/list/ReservationList.dart';
import 'package:turismosangolqui/src/models/Atractive_models.dart';
import 'package:turismosangolqui/src/services/atractives_service.dart';
import 'package:turismosangolqui/src/widgets/content/Atractive_widget.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key, this.atractive}) : super(key: key);
  
  final Atractive? atractive;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
   
  final AtractiveService _service = AtractiveService();
  List<Atractive>? _atractives = null;
  Set<Marker> _markers = new Set();

    Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kCentroLatacunga = CameraPosition(
    target: LatLng(-0.9335863141754581, -78.61500222658208),
    zoom: 18,
  );
  @override
  void initState() {
    super.initState();
    _loadPacients();
  }
  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura:$_heigth");
    return SingleChildScrollView(
      child: Column(
        children: [
                   ItemsMenu(
            title: ("Atractivos".toUpperCase()),
            image: ("assets/images/Atractivos.jpg"),
            method: AtractivesWidget(name: 'Atractivos Turísticos'),
          ),
          ItemsMenu(
            title: ("Lugares".toUpperCase()),
            image: ("assets/images/Lugares.jpg"),
            method: PlacesList(name: 'Lugares Turísticos'),
          ),
          ItemsMenu(
            title: ("Reservaciones".toUpperCase()),
            image: ("assets/images/Reservaciones.jpg"),
            method: ReservationList(
              name: 'Reservaciones',
            ),
          ),
          ItemsMenu(
            title: ("Entretenimiento".toUpperCase()),
            image: ("assets/images/Entretenimiento.jpg"),
            method: Text('Atractivos()'),
          ),
          ItemsMenu(
            title: ("Gastronomia".toUpperCase()),
            image: ("assets/images/Gastronomia.jpg"),
            method: Text(''),
          ),
          ItemsMenu(
            title: ("Acerca_de".toUpperCase()),
            image: ("assets/images/Acerca.jpg"),
            method: Text('Atractivos()'),
          ),
        ],
      ),
    );
    
  }
   _loadPacients() {
    _service.getAtractive().then((value) {
      _atractives = value;
      _atractives!.forEach((element) {
        if (element.georeference != null) {
          Marker mark = new Marker(
              markerId: MarkerId(element.name),
              infoWindow: InfoWindow(title: element.name),
              position: element.georeference!.getGeo());
          _markers.add(mark);
        }
      });

      if (mounted) {
        setState(() {});
      }
    });
  }
}
