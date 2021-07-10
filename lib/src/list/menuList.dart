// import 'package:flutter/material.dart';
// import 'package:turismosangolqui/src/models/Atractives_models.dart';
// import 'package:turismosangolqui/src/models/MenuPri_models.dart';
// import 'package:turismosangolqui/src/services/menusPri_service.dart';
// import 'package:turismosangolqui/src/list/AtractiveList.dart';

// class MenusList extends StatefulWidget {
//   MenusList({Key? key}) : super(key: key);

//   @override
//   _MenuListState createState() => _MenuListState();
// }

// class _MenuListState extends State<MenusList> {
//   MenusPriService _service = MenusPriService();
//   List<MenuPri> _menusPri = [];
//   List<String> list = ['AtractiveList()', 'EntretenimientoList()', '', '', ''];
//   _MenuListState(this.list);

//   @override
//   void initState() {
  
//     super.initState();

//     _loadMenusPri();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _menusPri.length == 0
//         ? Row(
//             children: [Center(child: Text('Descargando Items'))],
//           )
//         : Column(
//             children: _menusPri
//                 .map((e) => GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => Expanded(
//                                       child: SingleChildScrollView(
//                                           child:  ListTile(title: e.method))),
//                                 ));
//                           },
//                           child: Column(children: [
//                             ListTile(
//                               subtitle: Text(e.name),
//                               trailing: Icon(Icons.travel_explore,
//                                   color: Theme.of(context).backgroundColor),
//                             ),
//                             FittedBox(
//                               child: Image.asset(
//                                 e.photo ?? '',
//                                 height: 175,
//                                 width: MediaQuery.of(context).size.width,
//                                 fit: BoxFit.fitWidth,
//                               ),
//                             )
//                           ]),
//                         )
//                     //    Column(children: [
//                     //     ListTile(
//                     //       subtitle: Text(e.name),
//                     //       trailing: Icon(Icons.travel_explore,
//                     //           color: Theme.of(context).backgroundColor),
//                     //     ),
//                     //     FittedBox(
//                     //       child: Image.asset(
//                     //         e.photo ?? '',
//                     //         height: 175,
//                     //         width: MediaQuery.of(context).size.width,
//                     //         fit: BoxFit.fitWidth,
//                     //       ),
//                     //     )
//                     //   ]),
//                     )
//                 .toList());
//   }

//   _loadMenusPri() {
//     _service.getMenusPri().then((value) {
//       _menusPri = value;
//       setState(() {});
//     });
//   }
// }

// // GestureDetector(
// //               //tocar
// //               onTap: () {
// //                 Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => Expanded(
// //                           child: SingleChildScrollView(child: AtractiveList())),
// //                     ));
// //               },
// //               // child: Column(
// //               //     children: _menusPri
// //               //         .map(
// //               //           (e) => Column(children: [
// //               //             ListTile(
// //               //               title: Text(e.name),
// //               //               trailing: Icon(Icons.travel_explore,
// //               //                   color: Theme.of(context).backgroundColor),
// //               //             ),
// //               //             FittedBox(
// //               //               child: Image.asset(
// //               //                 e.photo ?? '',
// //               //                 height: 155,
// //               //                 width: MediaQuery.of(context).size.width,
// //               //                 fit: BoxFit.fitWidth,
// //               //               ),
// //               //             )
// //               //           ]),
// //               //         )
// //               //         .toList()),
// //             ),