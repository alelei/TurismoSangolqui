// import 'package:flutter/material.dart';
// import 'package:turismosangolqui/src/models/Atractives_models.dart';
// import 'package:turismosangolqui/src/models/MenuPri_models.dart';
// import 'package:turismosangolqui/src/services/atractives_service.dart';

// class AtractiveList extends StatefulWidget {
//   AtractiveList({Key? key}) : super(key: key);

//   @override
//   _AtractiveListState createState() => _AtractiveListState();
// }

// class _AtractiveListState extends State<AtractiveList> {
//   final AtractiveService _service = AtractiveService();
//   _AtractiveListState();
//   List<Atractive> _atractive = [];
//   final MenuPri menpri = MenuPri();

//   @override
//   void initState() {
//     super.initState();
//     _loadAtractive();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _atractive.length == 0
//         ? Container(
//             child: Text('Dowload...'),
//           )
//         : Container(
//             child: Column(
//                 // mainAxisAlignment : MainAxisAlignment.center,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: _atractive
//                     .map((e) => ListTile(
//                         title: Text(e.name,
//                             style: Theme.of(context).textTheme.headline3),
//                         leading: Image.network((e.photo ?? ""),
//                             width: 200, height: 200, fit: BoxFit.cover)))
//                     .toList()),
//           );
//   }

//   _loadAtractive() {
//     _service.getAtractive().then((value) {
//       _atractive = value;
//       setState(() {});
//     });
//   }
// }
