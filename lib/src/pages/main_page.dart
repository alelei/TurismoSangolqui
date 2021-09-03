import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turismosangolqui/src/list/ReservationList.dart';
import 'package:turismosangolqui/src/providers/app_provider.dart';
import 'package:turismosangolqui/src/utils/enums.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key, required this.titulo}) : super(key: key);
  final String titulo;
 
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: true);
    int selectedPage = appProvider.selectedPage;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:             Text(selectedPage == 0 ? titulo : menuOptions[selectedPage].label),

          actions: [
          PopupMenuButton<ItemMenu>(
            onSelected: (value) {
              if (value.label == "Configuración") {
                Navigator.pushNamed(context, "/settings");
               
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
