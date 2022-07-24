import 'package:cab/constants.dart';
import 'package:cab/resfont.dart';
import 'package:cab/screens/wallet/models/wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class WalletPage extends StatefulWidget {
  WalletPage({Key key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  List<WalletInfo> _list = WalletInfo.generateWalletInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WALLET'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: kPrimaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Available Balance',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          letterSpacing: 0.6,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\u{20B9}',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 0.6,
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal,
                          ),
                          Text(
                            '150.00',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NeumorphicButton(
                        margin: EdgeInsets.only(top: 12),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => MyHomePage(),
                          //   ),
                          // );
                        },
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.convex,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(10)),
                            depth: 2,
                            color: kPrimaryColor
                            // color: kSecondaryColor,
                            ),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Center(
                          child: Text(
                            'SEND TO BANK',
                            style: TextStyle(
                              fontSize: SizeConfig.screenHeight * 0.016,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockSizeHorizontal * 09,
                      ),
                      NeumorphicButton(
                        margin: EdgeInsets.only(top: 12),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => MyHomePage(),
                          //   ),
                          // );
                        },
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(10)),
                          depth: 2,
                          color: Colors.white,
                          // color: kSecondaryColor,
                        ),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Center(
                          child: Text(
                            '+ ADD MONEY',
                            style: TextStyle(
                              fontSize: SizeConfig.screenHeight * 0.016,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: _list.length,
                itemBuilder: (context, index) => buildTrips(index),
              ),
            ),
          ),
        ],
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
                            _list[index].iconImage,
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
                              _list[index].reason,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical * 0.9,
                            ),
                            Text(
                              _list[index].time,
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
                      // Text(
                      //   _list[index].paymentType,
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
              _list[index].source.toString() == ""
                  ? SizedBox()
                  : Column(
                      children: [
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
                                          colors: [
                                            kPrimaryColor,
                                            Colors.orange
                                          ],
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
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.blockSizeVertical * 2.3,
                                ),
                                Text(
                                  _list[index].destination,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal * 3,
                                  ),
                                ),
                              ],
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
