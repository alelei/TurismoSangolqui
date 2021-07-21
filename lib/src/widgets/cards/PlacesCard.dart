import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Place_models.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({Key? key, required this.currentPlace}) : super(key: key);
  final Place currentPlace;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 180,
        child: SizedBox(
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Container(),
                    // AtractivePage(atractive: currentPlace),
                  ));
            },
            title: Text(currentPlace.name.toString(),
                style: Theme.of(context).textTheme.headline5),
            subtitle: Row(children: [
              Expanded(
                child: Column(children: [
                  ListTile(
                    title: Text('Horario:'),
                    subtitle: Text(currentPlace.horario.toString()),
                  ),
                ]),
              ),
              Expanded(
                child: Column(
                  children: [
                    Card(
                      child: currentPlace.photo == null
                          ? Image.asset("assets/images/user.png")
                          : Image.asset(
                              currentPlace.photo.toString(),
                              fit: BoxFit.fill,
                              height: 130,
                              width: 200,
                            ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
