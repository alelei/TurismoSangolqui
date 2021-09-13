import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:turismosangolqui/src/list/AtractiveList.dart';
import 'package:turismosangolqui/src/models/Atractive_models.dart';
import 'package:turismosangolqui/src/services/atractives_service.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';

class AtractivesWidget extends StatefulWidget {
  const AtractivesWidget({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _AtractivesWidgetState createState() => _AtractivesWidgetState();
}

class _AtractivesWidgetState extends State<AtractivesWidget> {
  List<Atractive>? _atractives = null;
  final AtractiveService _service = AtractiveService();
  Set<Marker> _markers = new Set();

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kCentroLatacunga = CameraPosition(
    target: LatLng(-0.36296668730816567, -78.4170977712521),
    zoom: 10,
  );
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-0.36596668730816567, -78.7170977712521),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  void initState() {
    super.initState();
    _loadPacients();
  }

  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: Standard.appBar(
          context,
          ListTile(
            title: Standard.titleToForm(
                context, widget.name.toUpperCase(), TextAlign.center),
          )),
      body:  SingleChildScrollView(
              child: Column(
                
                children:  [
                  Text("Ubicación actual",
                      style: Theme.of(context).textTheme.bodyText1),
                  SizedBox(
                    height: _heigth * 0.4,
                    child: Container(
                      child: GoogleMap(
                        zoomControlsEnabled: true,
                        zoomGesturesEnabled: true,
                        rotateGesturesEnabled: true,
                        scrollGesturesEnabled: true,
                        markers: _markers,
                        mapType: MapType.hybrid,
                        initialCameraPosition: _kCentroLatacunga,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ),
                  ),                       
              
            
            Container(
              height: 250,
              
              
              
                child:  ListView(
                  children: [
                    AtractiveList(),
                  ],
                )),
             
            
          ]),
      ),
       
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
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

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
