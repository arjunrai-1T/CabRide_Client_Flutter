import 'package:cab/constants.dart';
import 'package:cab/resfont.dart';
import 'package:cab/screens/myTrips/models/trips.dart';
import 'package:cab/screens/states/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DriverInfoPage extends StatefulWidget {
  DriverInfoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DriverInfoPageState createState() => _DriverInfoPageState();
}

class _DriverInfoPageState extends State<DriverInfoPage> {
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
  List<TripInfo> _list = TripInfo.generateTripInfo();
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      // drawer: Appdeawer(),
      // ignore: unrelated_type_equality_checks

      body: Stack(
        children: [
          appState.initialPosition == null
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
                      child:
                          appState.initialPosition != appState.currentLocation
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
          SlidingSheet(
            elevation: 8,
            cornerRadius: 10,
            padding: EdgeInsets.all(20),
            snapSpec: const SnapSpec(
              // Enable snapping. This is true by default.
              snap: true,
              // Set custom snapping points.
              snappings: [0.37, 0.95],
              // the total available space that the sheet can expand to.
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            // The body widget will be displayed under the SlidingSheet
            // and a parallax effect can be applied to it.
            // body: Center(
            //   child: Text('This widget is below the SlidingSheet'),
            // ),
            builder: (context, state) {
              // This is the content of the sheet that will get
              // scrolled, if the content is bigger than the available
              // height of the sheet.
              return buildchooseCab();
            },
          ),
        ],
      ),
    );
  }

  Widget buildchooseCab() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Driver Info',
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Cancel Ride',
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
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
          Row(
            children: [
              Container(
                height: 65,
                width: 65,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/1.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.blockSizeVertical * 1.8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "George Smith",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      letterSpacing: 0.7,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 0.9,
                  ),
                  Row(
                    children: [
                      Text(
                        "4.7",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeVertical * 0.9,
                      ),
                      AbsorbPointer(
                        child: RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: 20,
                          allowHalfRating: true,
                          itemCount: 5,
                          tapOnlyMode: false,
                          glowColor: Colors.transparent,
                          maxRating: 4.5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                            rating = 4.5;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hyundai WagoneR",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      letterSpacing: 0.7,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 0.9,
                  ),
                  Text(
                    "DL 1 ZA 6535",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Arriving In",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      letterSpacing: 0.7,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 0.9,
                  ),
                  Text(
                    "08 mins",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ), // This trailing comma makes auto-formatting nicer for build methods.
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: SizeConfig.screenWidth * 0.7,
                child: NeumorphicButton(
                  // margin: EdgeInsets.only(top: 1),
                  onPressed: () async {
                    // _submitCommand(); //++else end
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
                      'CONTACT',
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
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            thickness: 5,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                'Trip Info',
                style: TextStyle(
                  fontSize: SizeConfig.screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Theme.of(context).accentColor.withOpacity(0.7),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                height: 100,
                width: 40,
                child: Stack(
                  children: [
                    Positioned(
                      left: 6,
                      child: Container(
                        width: 3,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            // colors: GradientColors.blue,
                            colors: [kPrimaryColor, Colors.orange],
                            // stops: []
                            stops: [0.2, 0.8],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        radius: 7,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 7,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "From",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Theme.of(context).accentColor.withOpacity(0.6),
                        ),
                      ),
                      Text(
                        "Baguiati, Kolkata, West Bengal",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0,
                      ),
                      Text(
                        "To",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor.withOpacity(0.6),
                        ),
                      ),
                      Text(
                        "Howrah Railway Station, Howrah, West Bengal",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Distance",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.0,
                      color: Theme.of(context).accentColor.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 0.9,
                  ),
                  Text(
                    "08 km",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Traveling time",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      color: Theme.of(context).accentColor.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 0.9,
                  ),
                  Text(
                    "EST. 17 mins",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Arrival",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      color: Theme.of(context).accentColor.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 0.9,
                  ),
                  Text(
                    "11.38 pm",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 5,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 0.5,
                        color: Theme.of(context).accentColor.withOpacity(0.6)),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 0.9,
                  ),
                  Text(
                    "Wallet",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\u{20B9} 567",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
