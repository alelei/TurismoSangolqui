import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:turismosangolqui/src/models/Atractive_models.dart';

class AtractiveDetailsWidget extends StatefulWidget {
  const AtractiveDetailsWidget({Key? key, required this.atractive})
      : super(key: key);
  final Atractive atractive;

  @override
  _AtractiveDetailsWidgetState createState() => _AtractiveDetailsWidgetState();
}

class _AtractiveDetailsWidgetState extends State<AtractiveDetailsWidget>

    with SingleTickerProviderStateMixin {
       Completer<GoogleMapController> _controller = Completer();
        static final CameraPosition _kCentroLatacunga = CameraPosition(
    target: LatLng(-0.48322009356849516, -78.43221998739993),
    zoom: 18,
  );
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Detalles'),
    Tab(text: 'Localización'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: TabBar(
        labelColor: Theme.of(context).accentColor,
        indicatorColor: Theme.of(context).primaryColor,
        controller: _tabController,
        tabs: myTabs,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_detail(), _localitation()],
      ),
    );
  }

  _detail() {
    return Card(
      margin: EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          widget.atractive.description,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  _localitation() {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(''),
        ),
        Container(
            child: Column(
              
                children: [Text("Ubicación actual", style: Theme.of(context).textTheme.bodyText1),
        Expanded(
           
            child: Container(
               height:MediaQuery.of(context).size.height * 0.5,
              child: GoogleMap(              
                mapType: MapType.hybrid,
                initialCameraPosition: _kCentroLatacunga,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            )),
                  ]  ))
      ],
    );
  }
}
