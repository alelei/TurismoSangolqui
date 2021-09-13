import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key, required this.currentPlace}) : super(key: key);
  final CollectionReference currentPlace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
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
                              flex: 2,
                              child: Column(children: [
                                ListTile(
                                  title: Text('Descripción:'),
                                  subtitle: Text(foods['description'], ),
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
                                                3,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    foods['photo'].toString()),
                                                fit: BoxFit.fill,
                                              ),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                width: 1,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Theme.of(context)
                                                      .primaryColorDark, //color of shadow
                                                  spreadRadius:
                                                      1, //spread radius
                                                  blurRadius: 2, // blur radius
                                                  offset: Offset(1,
                                                      2), // changes position of shadow
                                                  //first paramerter of offset is left-right
                                                  //second parameter is top to down
                                                ),
                                                //you can set more BoxShadow() here
                                              ],
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
