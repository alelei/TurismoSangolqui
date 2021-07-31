import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:turismosangolqui/src/models/ReservationUser_models.dart';

class ReservationUserService {
  ReservationUserService();

  //Future, indica que es una llama asíncrona
  Future<List<ReservationUser>> getReservationUser() async {
    List<ReservationUser> items = [];
    try {
      var uri = Uri.https(
          "us-central1-espe-sangolqui-turismo.cloudfunctions.net",
          "/api/api/reservation_user/1/10");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final menu = new ReservationUser.fromJson(item);
        items.add(menu);
      }
      return items;
    } on Exception catch (e) {
      print("Exception $e");
      return items;
    }
  }

  Future<dynamic> sendReservationUser(ReservationUser reservation) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri = Uri.https(
          "us-central1-espe-sangolqui-turismo.cloudfunctions.net",
          "/api/api/reservation_user");
      String reservationJson = reservationToJson(reservation);
      final resp =
          await http.post(uri, headers: _headers, body: reservationJson);
      if (resp.body.isEmpty) return null;
      return json.decode(resp.body);
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }
}
