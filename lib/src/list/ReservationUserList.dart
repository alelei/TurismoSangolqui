import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/ReservationUser_models.dart';
import 'package:turismosangolqui/src/services/reservationsUser_service.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';
import 'package:turismosangolqui/src/widgets/cards/ReservationUserCard.dart';

class ReservationUserList extends StatefulWidget {
  const ReservationUserList({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _ReservationUserListState createState() => _ReservationUserListState();
}

class _ReservationUserListState extends State<ReservationUserList> {
  final ReservationUserService _service = ReservationUserService();
  List<ReservationUser> _reservation = [];

  @override
  void initState() {
    super.initState();
    _loadReservationUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(title: Text(widget.name.toString())),
        _reservation == []
            ? Standard.getBoard(
                context, "No hay pacientes registrados", Icons.no_accounts)
            : _reservation.length == 0
                ? Standard.getBoard(
                    context, "Descargando Reservas", Icons.download)
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 14.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: _reservation
                            .map((e) => 
                                    ReservationUserCard(
                                  currentReservationUser: e,
                                ))
                            .toList()),
                  ),
      ],
    );
  }

  _loadReservationUser() {
    _service.getReservationUser().then((value) {
      _reservation = value;
      setState(() {});
    });
  }
}
