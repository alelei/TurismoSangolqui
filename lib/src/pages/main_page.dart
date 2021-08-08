import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismosangolqui/src/list/ReservationList.dart';
import 'package:turismosangolqui/src/pages/settings_page.dart';
import 'package:turismosangolqui/src/providers/app_provider.dart';
import 'package:turismosangolqui/src/utils/enums.dart';
import 'package:turismosangolqui/src/utils/standard_widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    int selectedPage = appProvider.selectedPage;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Standard.titleToForm(
          context,
          selectedPage == 0 ? widget.titulo : menuOptions[selectedPage].label,
          TextAlign.center,
        ),
        actions: [
          PopupMenuButton<ItemMenu>(
            onSelected: (value) {
              if (value.label == "Configuración") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              }
            },
            itemBuilder: (BuildContext context) {
              return settingsOptions.map((ItemMenu option) {
                return PopupMenuItem<ItemMenu>(
                    value: option,
                    child: Row(
                      children: [
                        Icon(option.icon,
                            color: Theme.of(context).primaryColor),
                        SizedBox(width: 14.0),
                        Text(option.label)
                      ],
                    ));
              }).toList();
            },
          ),
        ],
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 0.0),
          child: contentWidget[selectedPage]),
      floatingActionButton: selectedPage == 1
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReservationList(
                            name: 'Reservas',
                          )),
                );
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (value) {
            appProvider.selectedPage = value;
          },
          items: menuOptions
              .map((e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
              .toList()),
    );
  }
}
