
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:turismosangolqui/src/models/Atractive_Fire.dart';

// class FirestoreAtractives {
//   CollectionReference atractivesRef =
//       FirebaseFirestore.instance.collection(AtractiveF.collectionId);

//   Future<void> create(AtractiveF atractive) async {
//     await atractivesRef.add(atractive.toMap());
//   }

//   Future<AtractiveF> getById(String uid) async {
//     AtractiveF atractive;
//     DocumentSnapshot documentSnapshot = await atractivesRef.doc(uid).get();
//     if (documentSnapshot.exists) {
//       atractive =
//           AtractiveF.fromSnapshot(documentSnapshot.id, documentSnapshot.get(field).toString());
//     }
//     return atractive;
//   }

//   Future<List<AtractiveF>> get() async {
//     QuerySnapshot querySnapshot = await atractivesRef.get();
//     return querySnapshot.docs
//         .map((ds) => AtractiveF.fromSnapshot(ds.id, ds.data()))
//         .toList();
//   }

//   Stream<List<Usuario>> getByNombres(String nombres) {
//     return atractivesRef.where('nombres', isEqualTo: nombres).snapshots().map(
//         (e) => e.docs
//             .map((ds) => AtractiveF.fromSnapshot(ds.id, ds.data()))
//             .toList());
//   }
// }
