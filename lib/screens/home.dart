import 'package:cab/constants.dart';
import 'package:cab/screens/Drawer/drawer.dart';
import 'package:cab/screens/chooseCab.dart';
import 'package:cab/screens/states/app_states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Map());
  }
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Appdeawer(),
      // ignore: unrelated_type_equality_checks
      // floatingActionButton: appState.initialPosition != appState.currentLocation
      //     ? FloatingActionButton(
      //         backgroundColor: kPrimaryColor,
      //         onPressed: () {
      //           setState(() {
      //             appState.getLocation();
      //           });
      //         },
      //         child: Icon(
      //           Icons.location_searching_rounded,
      //           size: 30,
      //         ),
      //       )
      //     : SizedBox(),
      body: appState.initialPosition == null
          ? Container(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpinKitRotatingCircle(
                      color: Colors.black,
                      size: 50.0,
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: appState.locationServiceActive == false,
                  child: Text(
                    "Please enable location services!",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                )
              ],
            ))
          : Stack(
              children: <Widget>[
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: appState.initialPosition,
                    zoom: 16.0,
                  ),
                  onMapCreated: appState.onCreated,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  compassEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  buildingsEnabled: false,
                  rotateGesturesEnabled: true,
                  tiltGesturesEnabled: false,
                  trafficEnabled: false,
                  // markers: appState.markers,
                  onCameraMove: appState.onCameraMove,
                  // polylines: appState.polyLines,
                ),

                Positioned(
                  top: 55,
                  left: 15,
                  child: GestureDetector(
                    onTap: () {
                      if (_scaffoldKey.currentState.isDrawerOpen) {
                        _scaffoldKey.currentState.openEndDrawer();
                      } else {
                        _scaffoldKey.currentState.openDrawer();
                      }
                    },
                    child: Container(
                      child: Icon(
                        Icons.menu,
                        color: kPrimaryColor,
                        size: 45,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 110.0,
                  right: 15.0,
                  left: 15.0,
                  child: Container(
                    height: 50.0,
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 5.0),
                          blurRadius: 10,
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: appState.locationController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        // icon: Container(
                        //   margin: EdgeInsets.only(left: 20, top: 5),
                        //   width: 10,
                        //   height: 10,
                        //   child: Icon(
                        //     Icons.location_on,
                        //     color: Colors.black,
                        //   ),
                        // ),
                        icon: Icon(
                          Icons.location_on,
                          color: kPrimaryColor,
                        ),
                        hintText: "pick up",

                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 165.0,
                  right: 15.0,
                  left: 15.0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 5.0),
                          blurRadius: 10,
                          spreadRadius: 3,
                        )
                      ],
                    ),
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: appState.destinationController,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.black),
                      onSubmitted: (value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChooseCabPage(),
                          ),
                        );
                        appState.sendRequest(value);
                      },
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.local_taxi,
                          color: kPrimaryColor,
                        ),
                        hintText: "Where to ?",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: InputBorder.none,
                        // contentPadding: EdgeInsets.only(left: 15.0, top: 0.0),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  right: 30,
                  child: appState.initialPosition != appState.currentLocation
                      ? Container(
                          width: 35,
                          height: 35,
                          child: FloatingActionButton(
                            backgroundColor: kPrimaryColor,
                            onPressed: () {
                              setState(() {
                                appState.getLocation();
                              });
                            },
                            child: Icon(
                              Icons.location_searching_rounded,
                              size: 25,
                            ),
                          ),
                        )
                      : SizedBox(),
                )
//        Positioned(
//          top: 40,
//          right: 10,
//          child: FloatingActionButton(onPressed: _onAddMarkerPressed,
//          tooltip: "aadd marker",
//          backgroundColor: black,
//          child: Icon(Icons.add_location, color: white,),
//          ),
//        )
              ],
            ),
    );
  }
}
