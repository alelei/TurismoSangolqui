import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Reservation_models.dart';
import 'package:turismosangolqui/src/pages/reservation_form.dart';

class ReservationDetailsWidget extends StatefulWidget {
  const ReservationDetailsWidget({Key? key, required this.reservation})
      : super(key: key);
  final Reservation reservation;

  @override
  _ReservationDetailsWidgetState createState() =>
      _ReservationDetailsWidgetState();
}

class _ReservationDetailsWidgetState extends State<ReservationDetailsWidget>
    with SingleTickerProviderStateMixin {
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
        children: [_detail(), _treatments()],
      ),
    );
  }

  _detail() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                widget.reservation.description,
                textAlign: TextAlign.justify,
              ),
            ),
            Text('Agregar Reserva'),
            SingleChildScrollView(
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReservationForm(
                              reservation: widget.reservation,
                            )),
                  );
                },
                child: const Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }

  _treatments() {
    Color _color = Theme.of(context).canvasColor;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: ElevatedButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.add_box, color: _color),
              label: Container(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                child: Text("Agregar nuevo",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.apply(color: _color)),
              )),
        ),
        Container(
            child: SingleChildScrollView(
                // child: TreatmentList(idpacient: widget.pacient.idpatient)))
                ))
      ],
    );
  }
}
