import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Atractives_models.dart';
import 'package:turismosangolqui/src/pages/atractives_page.dart';

class AtractiveCard extends StatelessWidget {
  const AtractiveCard({Key? key, required this.currentAtractive})
      : super(key: key);
  final Atractive currentAtractive;

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
                    builder: (context) =>
                        AtractivePage(atractive: currentAtractive),
                  ));
            },
            title: Text(currentAtractive.name,
                style: Theme.of(context).textTheme.headline5),
            subtitle: Row(children: [
              Expanded(
                child: Column(children: [
                  ListTile(
                    leading: Icon(Icons.emoji_objects_outlined),
                    title: Text('Horario:'),
                    subtitle: Text(currentAtractive.horario),
                  ),
                ]),
              ),
              Expanded(
                child: Column(
                  children: [
                    Card(
                      child: currentAtractive.photo == null
                          ? Image.asset("images/user.png")
                          : Image.network(
                              currentAtractive.photo.toString(),
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
