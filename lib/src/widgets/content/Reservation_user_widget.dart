import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/list/ReservationUserList.dart';

class ReservationUserWidget extends StatefulWidget {
  const ReservationUserWidget({Key? key}) : super(key: key);

  @override
  _ReservationUserWidgetState createState() => _ReservationUserWidgetState();
}

class _ReservationUserWidgetState extends State<ReservationUserWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: ReservationUserList());
  }
}
