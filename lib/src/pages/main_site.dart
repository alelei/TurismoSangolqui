import 'package:flutter/material.dart';

class mainSite extends StatelessWidget {
  const mainSite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/m1.jpg"), fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
      
          children: [
            Text("Sangolqui", style: Theme.of(context).textTheme.headline3),
            Text("Iglesia", style: Theme.of(context).textTheme.headline5),
          ],

        ),
      )
      
      //child: null,
    );
  }
}