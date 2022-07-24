import 'dart:ui';

import 'package:cab/constants.dart';
import 'package:cab/resfont.dart';
import 'package:cab/screens/myTrips/models/trips.dart';
import 'package:flutter/material.dart';

class MyTrips extends StatefulWidget {
  MyTrips({Key key}) : super(key: key);

  @override
  State<MyTrips> createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> {
  List<TripInfo> _list = TripInfo.generateTripInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY TRIPS'),
      ),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: _list.length,
          itemBuilder: (context, index) => buildTrips(index),
        ),
      ),
    );
  }

  Widget buildTrips(index) => Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            _list[index].driverImages,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeVertical,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _list[index].time,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 0.9,
                            ),
                            Text(
                              _list[index].carName,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _list[index].amount,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 0.9,
                      ),
                      Text(
                        _list[index].paymentType,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 65,
                    width: 40,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 5,
                          child: Container(
                            width: 4,
                            height: 50,
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
                      Text(
                        _list[index].source,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical * 2.3,
                      ),
                      Text(
                        _list[index].destination,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockSizeHorizontal * 3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
