import 'package:cab/screens/states/app_states.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class OneMap extends StatefulWidget {
  OneMap({Key key}) : super(key: key);

  @override
  State<OneMap> createState() => _OneMapState();
}

class _OneMapState extends State<OneMap> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return appState.initialPosition == null
        ? Container()
        : GoogleMap(
            initialCameraPosition: CameraPosition(
              target: appState.initialPosition,
              zoom: 16.0,
            ),
            onMapCreated: appState.onCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            mapType: MapType.normal,
            compassEnabled: true,
            buildingsEnabled: false,
            rotateGesturesEnabled: true,
            markers: appState.markers,
            onCameraMove: appState.onCameraMove,
            polylines: appState.polyLines,
            trafficEnabled: false,
          );
  }
}
