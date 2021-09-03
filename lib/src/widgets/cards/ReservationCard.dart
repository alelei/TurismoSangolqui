import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Reservation_models.dart';

import 'package:turismosangolqui/src/pages/reservations_page.dart';

class ReservationCard extends StatelessWidget {
  const ReservationCard({Key? key, required this.currentReservation})
      : super(key: key);
  final Reservation currentReservation;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(2),
        height: 280,
        child: SizedBox(
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ReservationPage(reservation: currentReservation),
                  ));
            },
            title: Text(currentReservation.name,
                style: Theme.of(context).textTheme.headline6),
            subtitle: Row(children: [
              Expanded(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('Nombre:'),
                      subtitle: Text(
                        currentReservation.name,
                        
                      ),
                      leading: Icon(Icons.description_sharp,
                        color: Theme.of(context).accentColor,
                      ),
                      
                    ),
                    ListTile(
                      title: Text('Horario:'),
                      subtitle: Text(
                        currentReservation.horario,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      leading: Icon(Icons.date_range_rounded,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                    ListTile(
                      title: Text('Precio:'),
                      subtitle: Text(
                        currentReservation.price,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      leading: Icon(
                        Icons.money_sharp,
                        color: Theme.of(context).accentColor,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(
                                currentReservation.photo.toString(),
                              ),
                              fit: BoxFit.fitWidth))),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
