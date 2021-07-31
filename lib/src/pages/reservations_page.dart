import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Reservation_models.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';
import 'package:turismosangolqui/src/widgets/content/Resevation_detaills_widget.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key, required this.reservation})
      : super(key: key);
  final Reservation reservation;

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: CustomScrollView(
        slivers: [
          _appBar(),
          SliverFillRemaining(
              child: ReservationDetailsWidget(
            reservation: widget.reservation,
          )),
        ],
      ),
    ));
  }

  _appBar() {
    return SliverAppBar(
        title: Text(
          'Atras',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.68),
        pinned: true,
        expandedHeight: 500.0,
        flexibleSpace: FlexibleSpaceBar(
            background: Container(
          child: Column(children: [
            Container(
                padding: EdgeInsets.only(top: 72),
                height: 400,
                // ignore: unnecessary_null_comparison
                child: widget.reservation.photo == null
                    ? Image.asset("assets/images/user.png")
                    : Container(
                        margin: EdgeInsets.all(0),
                        height: 200,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(3),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .disabledColor, //color of shadow
                                  spreadRadius: 2, //spread radius
                                  blurRadius: 4, // blur radius
                                  offset: Offset.fromDirection(3, 3)
                                  // changes position of shadow
                                  //first paramerter of offset is left-right
                                  //second parameter is top to down
                                  ),
                            ],
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.reservation.photo.toString()),
                                fit: BoxFit.fill)),
                      )),
            Center(
              child: ListTile(
                title: Standard.titleToForm(
                    context, widget.reservation.name, TextAlign.center),
              ),
            ),
          ]),
        )));
  }
}
