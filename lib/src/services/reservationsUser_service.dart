import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:turismosangolqui/src/models/ReservationUser_models.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

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

  Future<String> uploadImage(File image) async {
    final cloudinary =
        CloudinaryPublic('espelsoftware', 'plr27ulz', cache: false);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );

      return response.secureUrl;
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
      return "";
    }
  }
}
