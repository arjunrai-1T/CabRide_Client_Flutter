import 'package:cab/constants.dart';
import 'package:cab/resfont.dart';
import 'package:cab/screens/driverInfoPage.dart';
import 'package:cab/screens/states/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ChooseCabPage extends StatefulWidget {
  ChooseCabPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChooseCabPageState createState() => _ChooseCabPageState();
}

class _ChooseCabPageState extends State<ChooseCabPage> {
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
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  List<String> categories = [
    "GoShare",
    "GoMeOnly",
    "GoBigger",
    "GoFast",
    "GoAuto",
    "GoToto",
    "GoBike"
  ];
  List<String> estPrice = ["199", "149", "422", "189", "89", "67", "120"];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey1,
      // drawer: Appdeawer(),
      // ignore: unrelated_type_equality_checks

      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: appState.initialPosition == null
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
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        mapType: MapType.normal,
                        compassEnabled: true,
                        buildingsEnabled: false,
                        rotateGesturesEnabled: true,
                        markers: appState.markers,
                        onCameraMove: appState.onCameraMove,
                        polylines: appState.polyLines,
                        trafficEnabled: false,
                      ),
                      Positioned(
                        top: 55,
                        left: 15,
                        child: GestureDetector(
                          onTap: () {
                            AppState().marker.clear();
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            child: Icon(
                              Icons.arrow_back,
                              color: kPrimaryColor,
                              size: 45,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: appState.initialPosition != appState
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
                    ],
                  ),
          ),
          Expanded(
            flex: 3,
            child: buildchooseCab(),
          )
        ],
      ),
    );
  }

  Widget buildchooseCab() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 15),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.wallet_membership_outlined,
                      color: kPrimaryColor,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.01,
                    ),
                    Text(
                      'Wallet',
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'Choose Cab Type',
                    style: TextStyle(
                      fontSize: SizeConfig.screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person_add_alt_1,
                      color: kPrimaryColor,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.01,
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 150,
            // color: Colors.red,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (contaxt, index) => buildCategory(index),
              scrollDirection: Axis.horizontal,
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NeumorphicButton(
                // margin: EdgeInsets.only(top: 1),
                onPressed: () async {
                  // _submitCommand(); //++else end
                },
                style: NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                    depth: 2,
                    color: kPrimaryColor
                    // color: kSecondaryColor,
                    ),
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Center(
                    child: Icon(
                  Icons.watch_later_outlined,
                )),
              ),
              Container(
                width: SizeConfig.screenWidth * 0.7,
                child: NeumorphicButton(
                  // margin: EdgeInsets.only(top: 1),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DriverInfoPage(),
                      ),
                    ); //++else end
                  },
                  style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10)),
                      depth: 2,
                      color: kPrimaryColor
                      // color: kSecondaryColor,
                      ),
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  child: Center(
                    child: Text(
                      'REQUEST CAB',
                      style: TextStyle(
                        fontSize: SizeConfig.screenHeight * 0.020,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        // color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCategory(index) => GestureDetector(
        onTap: () {
          setState(() {
            selectIndex = index;
          });
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: 25.0,
          ),
          child: Column(
            children: [
              Container(
                width: SizeConfig.blockSizeVertical * 10,
                height: SizeConfig.blockSizeVertical * 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // colors: GradientColors.blue,
                    colors: [
                      selectIndex == index ? kPrimaryColor : Colors.grey,
                      Colors.black
                    ],
                    // stops: []
                    stops: [0.8, 0.2],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.dstOver,
                    ),
                    child: Image.asset(
                      "assets/images/bike.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 0.5,
              ),
              Text(
                categories[index],
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeVertical * 1.7,
                  fontWeight: FontWeight.w800,
                  color: selectIndex == index
                      ? Theme.of(context).accentColor
                      : Colors.grey,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 0.5,
              ),
              Text(
                "EST " + estPrice[index],
                style: TextStyle(
                  fontSize: SizeConfig.blockSizeVertical * 1.5,
                  fontWeight: FontWeight.w400,
                  color: selectIndex == index
                      ? Theme.of(context).accentColor
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
}
