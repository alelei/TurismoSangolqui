import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/ReservationUser_models.dart';

class ReservationUserCard extends StatelessWidget {
  const ReservationUserCard({Key? key, required this.currentReservationUser})
      : super(key: key);
  final ReservationUser currentReservationUser;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          margin: EdgeInsets.all(2),
          height: 800,
          child: SizedBox(
            child: ListTile(
              title: Text(currentReservationUser.name,
                  style: Theme.of(context).textTheme.headline6),
              subtitle: Column(children: [
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          ListTile(
                            title: Text('Foto de Pago'),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20),
                              height: 120,
                              width: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        currentReservationUser.pago.toString(),
                                      ),
                                      fit: BoxFit.fitWidth))),
                        ],
                      ),
                      ListTile(
                        title: Text('Atractivo:'),
                        subtitle: Text(
                          currentReservationUser.name,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        leading: Icon(
                          Icons.power_input,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      ListTile(
                        title: Text('Fecha Ingreso:'),
                        subtitle: Text(
                          currentReservationUser.fecha_ingreso
                              .toString()
                              .split(' ')[0],
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        leading: Icon(Icons.date_range_rounded),
                      ),
                      ListTile(
                        title: Text('Fecha Salida:'),
                        subtitle: Text(
                          currentReservationUser.fecha_Salida
                              .toString()
                              .split(' ')[0],
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        leading: Icon(Icons.date_range_rounded),
                      ),
                      ListTile(
                        title: Text('Número de Ninos:'),
                        subtitle: Text(
                          currentReservationUser.number_childrens,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        leading: Icon(
                          Icons.person,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      ListTile(
                        title: Text('Numero de Adultos:'),
                        subtitle: Text(
                          currentReservationUser.number_adults,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        leading: Icon(
                          Icons.person,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      ListTile(
                        title: Text('Precio:'),
                        subtitle: Text(
                          currentReservationUser.price,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        leading: Icon(
                          Icons.money_sharp,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      ListTile(
                        title: Text('Dias:'),
                        subtitle: Text(
                          currentReservationUser.days.toString(),
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        leading: Icon(
                          Icons.cloud_done,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      ListTile(
                        title: Text('Description:'),
                        subtitle: Text(
                          'Hotel',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        leading: Icon(
                          Icons.description,
                          color: Theme.of(context).accentColor,
                        ),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
