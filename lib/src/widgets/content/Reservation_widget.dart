import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/list/ReservationList.dart';

class ReservationWidget extends StatefulWidget {
  const ReservationWidget({Key? key}) : super(key: key);

  @override
  _ReservationWidgetState createState() => _ReservationWidgetState();
}

class _ReservationWidgetState extends State<ReservationWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: ReservationList(name: 'Alex',));
  }
}
