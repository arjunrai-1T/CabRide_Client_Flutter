import 'package:cab/screens/accountScreen/widget/change_number_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'profile_pic.dart';

class ProfileInfoEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsScreen(
      title: 'Edit Profile',
      children: [
        Column(
          children: [
            SizedBox(height: 20),
            ProfilePic(),
            SizedBox(height: 20),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    _bottomSheet(context);
                  },
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  // dense: true,
                  title: Text(
                    'First Name',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).accentColor.withOpacity(0.6)),
                  ),
                  leading: Icon(
                    Icons.person,
                    color: Theme.of(context).accentColor,
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: Theme.of(context).accentColor,
                  ),
                  subtitle: Text(
                    'Shuvam',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  // horizontalTitleGap: 10,
                  // enableFeedback: true,
                ),
              ],
            ),
            Divider(),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    _bottomSheet(context);
                  },
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  // dense: true,
                  title: Text(
                    'Last Name',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).accentColor.withOpacity(0.6)),
                  ),
                  leading: Icon(
                    Icons.error_outline_outlined,
                    color: Theme.of(context).accentColor,
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: Theme.of(context).accentColor,
                  ),
                  subtitle: Text(
                    'Mondal',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  // horizontalTitleGap: 10,
                  // enableFeedback: true,
                ),
              ],
            ),
            Divider(),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    _bottomSheet(context);
                  },
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  // dense: true,
                  title: Text(
                    'Email Address',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).accentColor.withOpacity(0.6)),
                  ),
                  leading: Icon(
                    Icons.error_outline_outlined,
                    color: Theme.of(context).accentColor,
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: Theme.of(context).accentColor,
                  ),
                  subtitle: Text(
                    'shuvam.mondal008@gmail.com',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  // horizontalTitleGap: 10,
                  // enableFeedback: true,
                ),
                ListTile(
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    dense: true,
                    title: Text(
                        'data dsa;dlsalkasdm sdnlskmdlasmd lnd askmdlsad lsdnsksadls dl dl dl dlas '),
                    leading: Text(''),
                    subtitle: Text(''),
                    trailing: Text('')),
              ],
            ),
            Divider(),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    _bottomSheet(context);
                  },
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  // dense: true,
                  title: Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).accentColor.withOpacity(0.6)),
                  ),
                  leading: Icon(
                    Icons.error_outline_outlined,
                    color: Theme.of(context).accentColor,
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: Theme.of(context).accentColor,
                  ),
                  subtitle: Text(
                    '*********',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  // horizontalTitleGap: 10,
                  // enableFeedback: true,
                ),
                ListTile(
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    dense: true,
                    title: Text(
                        'data dsa;dlsalkasdm sdnlskmdlasmd lnd askmdlsad lsdnsksadls dl dl dl dlas '),
                    leading: Text(''),
                    subtitle: Text(''),
                    trailing: Text('')),
              ],
            ),
            Divider(),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNumberView(),
                      ),
                    );
                  },
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  // dense: true,
                  title: Text(
                    'Phone',
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).accentColor.withOpacity(0.6)),
                  ),
                  leading: Icon(
                    Icons.phone,
                    color: Theme.of(context).accentColor,
                  ),
                  trailing: Icon(
                    Icons.edit,
                    color: Theme.of(context).accentColor,
                  ),
                  subtitle: Text(
                    '+91 8013507665',
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  // horizontalTitleGap: 10,
                  // enableFeedback: true,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  _bottomSheet(context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 210.0,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Text(
                      'Please Enter your first name',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.emoji_emotions),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'cancel'.toUpperCase(),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'ok'.toUpperCase(),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
