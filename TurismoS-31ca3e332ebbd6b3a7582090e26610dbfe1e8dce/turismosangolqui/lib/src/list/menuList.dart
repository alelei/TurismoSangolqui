import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/MenuPri_models.dart';
import 'package:turismosangolqui/src/pages/main_site.dart';
import 'package:turismosangolqui/src/services/patient_service.dart';

class menusList extends StatefulWidget {
  const menusList({Key? key}) : super(key: key);

  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<menusList> {
  MenuPriService _service = MenuPriService();
  List<MenuPri> _MenusPri = [];
  
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
    return _MenusPri.length == 0? Container(
            child: Center(child: Text('Descargando Items')),
          ): 
          
          Container(
            child: GestureDetector( //tocar
             onTap: (){
               
              Navigator.push(context, MaterialPageRoute(builder: (context)=> mainSite(),
        ));
             },
          child: Column(
            // mainAxisAlignment : MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
              children:
                  _MenusPri.map((e) =>ListTile(title :Text(e.name, style: Theme.of(context).textTheme.headline3) ,
                  
                  leading:Image.network((e.photo??""), width: 200, height: 200, fit: BoxFit.cover))).toList()),
        ));
  }
 

  _loadMenusPri() {
    _service.getMenuPri().then((value)  {
       _MenusPri = value;
       setState(() {});
     });
  }
}
