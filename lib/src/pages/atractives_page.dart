import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Atractive_models.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';
import 'package:turismosangolqui/src/widgets/content/Atractives_details_widget.dart';

class AtractivePage extends StatefulWidget {
  const AtractivePage({Key? key, required this.atractive}) : super(key: key);
  final Atractive atractive;

  @override
  _AtractivePageState createState() => _AtractivePageState();
}

class _AtractivePageState extends State<AtractivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _appBar(),
        SliverFillRemaining(
            child: AtractiveDetailsWidget(atractive: widget.atractive))
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
        expandedHeight: 480.0,
        flexibleSpace: FlexibleSpaceBar(
            background: Container(
          child: Column(children: [
            Container(
                padding: EdgeInsets.only(top: 72),
                height: 450,
                child: widget.atractive.photo == null
                    ? Image.asset("assets/images/user.png")
                    : Container(
                        margin: EdgeInsets.all(5),
                        height: 200,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(2),
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
                                    widget.atractive.photo.toString()),
                                fit: BoxFit.fill)),
                      )),
            Center(
              child: ListTile(
                title: Standard.titleToForm(
                    context, widget.atractive.name, TextAlign.center),
              ),
            ),
          ]),
        )));
  }
}
