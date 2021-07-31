import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:turismosangolqui/src/models/Reservation_models.dart';


class ReservationService {
  ReservationService();

  //Future, indica que es una llama asíncrona
  Future<List<Reservation>> getReservation() async {
    List<Reservation> items = [];
    try {
      
      var uri = Uri.https(
          "us-central1-espe-sangolqui-turismo.cloudfunctions.net", "/api/api/reservation/1/10");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final menu = new Reservation.fromJson(item);
        items.add(menu);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }
}
