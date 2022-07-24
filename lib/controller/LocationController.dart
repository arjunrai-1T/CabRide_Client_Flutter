// import 'dart:async';
// import 'dart:convert';

// import 'package:cab/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoder/geocoder.dart';

// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';


// import 'package:shared_preferences/shared_preferences.dart';

// class LocationController extends GetxController {
//   var latitude = 0.0.obs;
//   var longitude = 0.0.obs;
//   var address = "".obs;

//   getAddress({required position}) async {
//     Geocoder.getFromLocation(
//             latitude: position.latitude,
//             longitude: position.longitude,
//             googleMapApiKey: AppConstants.mapApiKey)
//         .then((value) {
//       address(value.results.first.formattedAddress);
//     });
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     String id = preferences.getString("id");
//     var data = {
//       "latitude": position.latitude,
//       "longitude": position.longitude,
//     };
//     // ApiService.update(
//     //         table: AppConstants.userTable, where: "id=${id}", data: data)
//     //     .then((value) => print(value));
//   }

 
// }
