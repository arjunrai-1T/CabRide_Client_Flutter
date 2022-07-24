import 'package:cab/resfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../constants.dart';

class ReferPage extends StatefulWidget {
  ReferPage({Key key}) : super(key: key);

  @override
  State<ReferPage> createState() => _ReferPageState();
}

class _ReferPageState extends State<ReferPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 5,
                      color: Colors.white,
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical * 34,
                      color: Colors.red,
                      child: Image.asset(
                        "assets/images/refer.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 5,
                  left: 40,
                  right: 40,
                  child: Neumorphic(
                    padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                    style: NeumorphicStyle(
                      color: kPrimaryColor,
                      border: NeumorphicBorder(
                        color: Color(0x33000000),
                        width: 0.8,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Your Raferral Code',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal * 2,
                        ),
                        Text(
                          '724312',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 7.5,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Refer and Earn',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeHorizontal * 4,
                        ),
                        Text(
                          'Share the referral code with your frinds and family members and get 50% off on Cab fare.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/facebook.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 65,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/whatsapp.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 65,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/twitter.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 65,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/more.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
