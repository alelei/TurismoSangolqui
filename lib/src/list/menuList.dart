import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/MenuPri_models.dart';
import 'package:turismosangolqui/src/services/menusPri_service.dart';
import 'package:turismosangolqui/src/widgets/cards/atractiveListCard.dart';

class MenusList extends StatefulWidget {
  const MenusList({Key? key}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenusList> {
  MenusPriService _service = MenusPriService();
  List<MenuPri> _menusPri = [];

  @override
  void initState() {
    super.initState();

    _loadMenusPri();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _menusPri.length == 0
        ? Container(
            child: Center(child: Text('Descargando Items')),
          )
        : Container(
            child: Column(
            children: [
              GestureDetector(
                //tocar
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Expanded(
                            child:
                                SingleChildScrollView(child: AtractiveList())),
                      ));
                },
                child: Column(
                    children: _menusPri
                        .map((e) => Container(
                              child: Column(children: [
                                ListTile(
                                  title: Text(e.name),
                                  subtitle: Text(e.method),
                                  leading: Icon(Icons.ac_unit_rounded,
                                      color: Theme.of(context).backgroundColor),
                                ),
                                Image.asset(
                                  e.photo ?? '',
                                  height: 145,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ]),
                            ))
                        .toList()),
              ),
            ],
          ));
  }

  _loadMenusPri() {
    _service.getMenusPri().then((value) {
      _menusPri = value;
      setState(() {});
    });
  }
}
