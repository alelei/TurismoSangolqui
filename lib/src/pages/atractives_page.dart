import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Atractive_models.dart';
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
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
            background: Container(
          child: Column(children: [
            Container(
                padding: EdgeInsets.only(top: 42),
                height: 200,
                child: widget.atractive.photo == null
                    ? Image.asset("images/user.png")
                    : Container(
                        height: 200,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(30),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.atractive.photo.toString()),
                                fit: BoxFit.fitWidth)),
                      )),
            ListTile(
              title: Text(
                widget.atractive.name,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
          ]),
        )));
  }
}
