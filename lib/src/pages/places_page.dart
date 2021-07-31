import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Place_models.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';
import 'package:turismosangolqui/src/widgets/content/Place_details_widget.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({Key? key, required this.place}) : super(key: key);
  final Place place;

  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _appBar(),
        SliverFillRemaining(
            child: PlaceDetailsWidget(place: this.widget.place,))
      ],
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
                child: widget.place.photo == null
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
                                image: AssetImage(
                                    widget.place.photo.toString()),
                                fit: BoxFit.fill)),
                      )),
            Center(
              child: ListTile(
                title: Standard.titleToForm(
                    context, widget.place.name.toString(), TextAlign.center),
              ),
            ),
          ]),
        )));
  }
}
