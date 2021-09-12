import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:turismosangolqui/src/models/Place_models.dart';
import 'package:turismosangolqui/src/widgets/cards/FoodCard.dart';
import 'package:turismosangolqui/src/widgets/cards/PlacesCard.dart';

class FoodList extends StatefulWidget {
  const FoodList({
    Key? key,
  }) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   CollectionReference food =
        FirebaseFirestore.instance.collection('food');
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textController,
        ),
      ),
      body: SingleChildScrollView(
        
          child: Column(
            children: [
              FoodCard(currentPlace: food),
            ]                    
          ),
        ),
     
      
    );
    
  }
}
