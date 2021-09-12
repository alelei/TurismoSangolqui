import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/pages/food_page.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key, required this.currentPlace}) : super(key: key);
  final CollectionReference currentPlace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          StreamBuilder(
              stream: currentPlace.orderBy('name').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text('Loading'));
                }
                return Flexible(
                  child: ListView(
                    children: snapshot.data!.docs.map((foods) {
                      return Center(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Text('hey'),
                                ));
                          },
                          title: Text(foods['name'],
                              style: Theme.of(context).textTheme.headline5),
                          onLongPress: () {
                            foods.reference.delete();
                          },
                          subtitle: Row(children: [
                            Expanded(
                              child: Column(children: [
                                ListTile(
                                  title: Text('Descripción:'),
                                  subtitle: Text(foods['description']),
                                ),
                              ]),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Card(
                                    child: foods['photo'].toString() != ''
                                        ? Container(
                                            margin: EdgeInsets.only(top: 9),
                                            height: 150,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            child: Image.network(
                                              foods['photo'].toString(),
                                              fit: BoxFit.fill,
                                              height: 230,
                                              width: 200,
                                            ),
                                          )
                                        : Image.asset(
                                            "assets/images/user.png",
                                            height: 130,
                                            width: 200,
                                          ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
