import 'package:cab/constants.dart';
import 'package:cab/screens/accountScreen/components/profileInfoEdit.dart';
import 'package:cab/screens/accountScreen/settings_page.dart';
import 'package:cab/screens/home.dart';
import 'package:cab/screens/myTrips/myTrips.dart';
import 'package:cab/screens/refer/referPage.dart';
import 'package:cab/screens/wallet/walletPage.dart';
import 'package:flutter/material.dart';

import '../../resfont.dart';
import 'menuitem.dart';

class Appdeawer extends StatefulWidget {
  Appdeawer({Key key}) : super(key: key);

  @override
  _AppdeawerState createState() => _AppdeawerState();
}

class _AppdeawerState extends State<Appdeawer> {
  void signout(BuildContext context) async {} //++void signup() async end

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Drawer(
      elevation: 0,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Container(
        //transform: Matrix4.translationValues(0.0, -50.0, 0.0),
        // color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    //padding: const EdgeInsets.symmetric(horizontal: 20),
                    //color: const Color(0xFF262AAA),
                    child: Column(
                      children: <Widget>[
                        // SizedBox(
                        //   height: 70,
                        // ),
                        DrawerHeader(
                          curve: Curves.bounceOut,
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.zero,
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProfileInfoEdit(),
                              ),
                            ),
                            child: Center(
                              child: ListTile(
                                title: Text(
                                  "Kathy Wills",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          2 * SizeConfig.blockSizeVertical,
                                      fontWeight: FontWeight.w800),
                                ),
                                subtitle: Text(
                                  "View Profile",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        1.4 * SizeConfig.blockSizeVertical,
                                  ),
                                ),
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    "assets/images/profile_logo.jpg",
                                  ),
                                  radius: 25,
                                ),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                          ),
                        ),
                        MenuItem(
                          icon: Icons.home,
                          title: "HOME",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MyHomePage(),
                            ),
                          ),
                        ),
                        MenuItem(
                          icon: Icons.local_taxi,
                          title: "MY TRIPS",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MyTrips(),
                            ),
                          ),
                        ),
                        MenuItem(
                          icon: Icons.account_balance_wallet,
                          title: "WALLET",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => WalletPage(),
                            ),
                          ),
                        ),
                        MenuItem(
                          icon: Icons.help,
                          title: "SETTINGS",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SettingsPage(),
                            ),
                          ),
                        ),
                        MenuItem(
                          icon: Icons.share,
                          title: "REFER AND EARN",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ReferPage(),
                            ),
                          ),
                        ),

                        GestureDetector(
                          onTap: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsPage()));
                          },
                          child: MenuItem(
                            icon: Icons.exit_to_app,
                            title: "Logout",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            //       child: BottomLogo(),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   color: Colors.white,
      //   margin: EdgeInsets.zero,
      //   padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      //   child: MyHomePage(),
      // ),
    );
  }
}//class _AppdeawerState extends State<Appdeawer> end
