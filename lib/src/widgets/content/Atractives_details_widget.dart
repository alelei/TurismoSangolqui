import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Atractive_models.dart';

class AtractiveDetailsWidget extends StatefulWidget {
  const AtractiveDetailsWidget({Key? key, required this.atractive})
      : super(key: key);
  final Atractive atractive;

  @override
  _AtractiveDetailsWidgetState createState() => _AtractiveDetailsWidgetState();
}

class _AtractiveDetailsWidgetState extends State<AtractiveDetailsWidget>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Detalles'),
    Tab(text: 'Localización'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(
        labelColor: Theme.of(context).accentColor,
        indicatorColor: Theme.of(context).primaryColor,
        controller: _tabController,
        tabs: myTabs,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_detail(), _treatments()],
      ),
    );
  }

  _detail() {
    return Card(
      margin: EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          widget.atractive.description,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  _treatments() {
    Color _color = Theme.of(context).canvasColor;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: ElevatedButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.add_box, color: _color),
              label: Container(
                padding: const EdgeInsets.symmetric(vertical: 7.0),
                child: Text("Agregar nuevo",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.apply(color: _color)),
              )),
        ),
        Container(
            child: SingleChildScrollView(
                // child: TreatmentList(idpacient: widget.pacient.idpatient)))
                ))
      ],
    );
  }
}
