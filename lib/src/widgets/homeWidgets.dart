
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:turismosangolqui/src/list/Items_Menu.dart';
import 'package:turismosangolqui/src/list/PlacesList.dart';
import 'package:turismosangolqui/src/list/ReservationList.dart';
import 'package:turismosangolqui/src/models/Atractive_models.dart';
import 'package:turismosangolqui/src/widgets/content/Atractive_widget.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key, this.atractive}) : super(key: key);
  
  final Atractive? atractive;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
   Set<Marker> _markers = new Set();

    Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kCentroLatacunga = CameraPosition(
    target: LatLng(-0.9335863141754581, -78.61500222658208),
    zoom: 18,
  );
  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura:$_heigth");
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Ubicación actual", style: Theme.of(context).textTheme.bodyText1),
        SizedBox(
            height: _heigth * 0.5,
            child: GoogleMap(
              markers: _markers,
              mapType: MapType.hybrid,
              initialCameraPosition: _kCentroLatacunga,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            )),
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
}
