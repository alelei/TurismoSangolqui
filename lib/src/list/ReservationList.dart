import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Reservation_models.dart';
import 'package:turismosangolqui/src/services/reservations_service.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';
import 'package:turismosangolqui/src/widgets/cards/Reservationcard.dart';

class ReservationList extends StatefulWidget {
  const ReservationList({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _ReservationListState createState() => _ReservationListState();
}

class _ReservationListState extends State<ReservationList> {
  final ReservationService _service = ReservationService();
  List<Reservation> _reservation = [];

  @override
  void initState() {
    super.initState();
    _loadReservation();
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
            _reservation == []
                ? Standard.getBoard(
                    context, "No hay Reservas registrados", Icons.no_accounts)
                : _reservation.length == 0
                    ? Standard.getBoard(
                        context, "Descargando Reservas", Icons.download)
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 14.0),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: _reservation
                                .map((e) => ReservationCard(
                                      currentReservation: e,
                                    ))
                                .toList()),
                      ),
          ],
        )));
  }

  _loadReservation() {
    _service.getReservation().then((value) {
      _reservation = value;
      setState(() {});
    });
  }
}
