import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/list/favorite_element_list.dart';
import 'package:turismosangolqui/src/widgets/content/favorite_element_form.dart';

class FavoriteElementPage extends StatefulWidget {
  const FavoriteElementPage({Key? key}) : super(key: key);

  @override
  _FavoriteElementPageState createState() => _FavoriteElementPageState();
}

class _FavoriteElementPageState extends State<FavoriteElementPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Formulario'),
    Tab(text: 'Listado'),
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
        labelColor: Theme.of(context).primaryColor,
        controller: _tabController,
        tabs: myTabs,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [FavoriteElementForm(), FavoriteElementList()],
      ),
    );
  }
}
