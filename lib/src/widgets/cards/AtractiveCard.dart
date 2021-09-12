import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Atractive_models.dart';
import 'package:turismosangolqui/src/pages/atractives_page.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';

class AtractiveCard extends StatelessWidget {
  const AtractiveCard({Key? key, required this.currentAtractive})
      : super(key: key);
  final Atractive currentAtractive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 199,
      margin: EdgeInsetsDirectional.only(top: 20),
      child: Card(
        margin: EdgeInsets.all(0),
        child: SizedBox(
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AtractivePage(
                      atractive: currentAtractive,
                    ),
                  ));
            },
            title: Text(currentAtractive.name,
                style: Theme.of(context).textTheme.headline6),
            subtitle: Row(children: [
              Expanded(
                child: Column(children: [
                  Standard.getInfoLine(context, 'Horario',
                      currentAtractive.horario, Icons.date_range),
                  Standard.getInfoLine(
                      context, 'Tipo', 'Cascada', Icons.nature_rounded)
                ]),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 9),
                    height: 150,
                    width: MediaQuery.of(context).size.width / 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      image: DecorationImage(
                          image:
                              NetworkImage(currentAtractive.photo.toString()),
                          fit: BoxFit.fill,),
                      border: Border.all(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .primaryColorDark, //color of shadow
                          spreadRadius: 1, //spread radius
                          blurRadius: 2, // blur radius
                          offset: Offset(1, 2), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                        //you can set more BoxShadow() here
                      ],
                    ),
                  ),
                  // Container(
                  //     margin: EdgeInsets.only(top: 5),
                  //     height: MediaQuery.of(context).size.height / 6,
                  //     width: MediaQuery.of(context).size.width / 2.2,
                  //     decoration: BoxDecoration(
                  //         border: Border.all(
                  //           width: 1,
                  //         ),
                  //         borderRadius: BorderRadius.circular(4),
                  //         image: DecorationImage(
                  //             image: NetworkImage(
                  //               currentAtractive.photo.toString(),
                  //             ),
                  //             fit: BoxFit.fill))),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
