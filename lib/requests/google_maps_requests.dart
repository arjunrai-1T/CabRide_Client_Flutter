import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = "AIzaSyD1h2-jYyopNB9wRU5aXUEh_z_XoI4iTco";

class GoogleMapsServices {
  Future<String> getRouteCoordinates(LatLng l1, LatLng l2) async {
    var url = Uri.parse(
        "https://maps.googleapis.com/maps/api/directions/json?origin=${l1.latitude},${l1.longitude}&destination=${l2.latitude},${l2.longitude}&key=$apiKey");

    http.Response response = await http.get(url);
    Map values = jsonDecode(response.body);
    return values["routes"][0]["overview_polyline"]["points"];
  }
}
