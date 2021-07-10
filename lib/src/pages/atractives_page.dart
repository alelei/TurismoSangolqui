import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Atractives_models.dart';
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
          widget.atractive.name,
          style: Theme.of(context).textTheme.caption,
        ),
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        pinned: true,
        expandedHeight: 250.0,
        flexibleSpace: FlexibleSpaceBar(
            background: Container(
          child: Column(children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 42),
                height: 170.0,
                child: widget.atractive.photo == null
                    ? Image.asset("images/user.png")
                    : FadeInImage(
                        placeholder: AssetImage('images/user.png'),
                        image:
                            NetworkImage(widget.atractive.photo.toString()))),
            Text(widget.atractive.name,
                style: Theme.of(context).textTheme.headline4),
            Text(widget.atractive.description)
          ]),
        )));
  }
}
