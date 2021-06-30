// import 'package:flutter/material.dart';
// import 'package:turismosangolqui/src/models/MenuPri_models.dart';
// import 'package:turismosangolqui/src/services/menusPri_service.dart';
// import 'package:turismosangolqui/src/widgets/cards/atractiveListCard.dart';

// class menusList extends StatefulWidget {
//   const menusList({Key? key}) : super(key: key);

//   @override
//   _MenuListState createState() => _MenuListState();
// }

// class _MenuListState extends State<menusList> {
//   MenusPriService _service = MenusPriService();
//   List<MenuPri> _MenusPri = [];

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
//     return _MenusPri.length == 0
//         ? Container(
//             child: Center(child: Text('Descargando Items')),
//           )
//         : Container(
//             height: 400,
//             width: 1200,
//             child: Card(
//               child: Image.asset(
//                 'images/Atractivos.jpg',
//                 fit: BoxFit.cover,
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               elevation: 5,
//               margin: EdgeInsets.all(10),
              
//             )
//             ,
//             // child: Column(
//             //     // mainAxisAlignment : MainAxisAlignment.center,
//             //     // crossAxisAlignment: CrossAxisAlignment.center,
//             //     children: _MenusPri.map((e) => ListTile(
//             //         title: Text(e.name,
//             //             style: Theme.of(context).textTheme.headline3),
//             //         leading: Image.asset((e.photo ?? "error"),
//             //             width: 200, height: 200, fit: BoxFit.cover))).toList()),
//           );
//   }

//   _loadMenusPri() {
//     _service.getMenusPri().then((value) {
//       _MenusPri = value;
//       setState(() {});
//     });
//   }
// }
