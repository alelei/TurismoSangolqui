import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Atractive_models.dart';
import 'package:turismosangolqui/src/pages/atractives_page.dart';

class AtractiveCard extends StatelessWidget {
  const AtractiveCard({Key? key, required this.currentAtractive})
      : super(key: key);
  final Atractive currentAtractive;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(2),
        height: 180,
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
                style: Theme.of(context).textTheme.headline5),
            subtitle: Row(children: [
              Expanded(
                child: Column(children: [
                  ListTile(
                    title: Text('Horario:'),
                    subtitle: Text(
                      currentAtractive.horario,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    leading: Icon(
                      Icons.date_range,
                      color: Theme.of(context).accentColor,
                    ), 
                  ),
                ]),
              ),
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 130,
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(
                                currentAtractive.photo.toString(),
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
