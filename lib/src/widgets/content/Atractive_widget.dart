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
        body: SingleChildScrollView(
          
          child: Column(
            children: [Text("Ubicación actual", style: Theme.of(context).textTheme.bodyText1),
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
              AtractiveList(),
            ],
          ),
        ));
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
