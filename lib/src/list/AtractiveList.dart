import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Atractive_models.dart';
import 'package:turismosangolqui/src/services/atractives_service.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';
import 'package:turismosangolqui/src/widgets/cards/AtractiveCard.dart';

class AtractiveList extends StatefulWidget {
  const AtractiveList({Key? key, required this.name}) : super(key: key);
  final Widget name;
  @override
  _AtractiveListState createState() => _AtractiveListState();
}

class _AtractiveListState extends State<AtractiveList> {
  final AtractiveService _service = AtractiveService();
  List<Atractive> _atractive = [];

  @override
  void initState() {
    super.initState();
    _loadAtractive();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(title: widget.name),
        Container(
            color: Theme.of(context).cardColor,
            child: _atractive.length == 0
                ? Column(
                    children: [
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          color: Theme.of(context).cardColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Standard.getBoard(context,
                                  'Descargando Atractivos', (Icons.download))
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    child: Column(
                        // mainAxisAlignment : MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: _atractive
                            .map((e) => AtractiveCard(currentAtractive: e))
                            .toList())))
      ],
    );
  }

  _loadAtractive() {
    _service.getAtractive().then((value) {
      _atractive = value;
      setState(() {});
    });
  }
}
