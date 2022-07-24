import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class ChangeNumberView extends StatelessWidget {
  const ChangeNumberView({Key key}) : super(key: key);
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyPassword = 'key-password';
  @override
  Widget build(BuildContext context) {
    return SettingsScreen(
      title: 'Change Number',
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Enter your old phone number with country code:',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              SettingsGroup(
                title: 'Phone',
                children: [
                  buildPhoneNumber(context),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Enter your new phone number with country code:',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              SettingsGroup(
                title: 'Phone',
                children: [
                  buildPhoneNumber(context),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.red.shade400)),
                  onPressed: () {},
                  child: Text(
                    'Delete my account'.toUpperCase(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPhoneNumber(context) => Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  hintText: "+91",
                ),
                onChanged: (value) {
                  // this.phoneNo=value;
                  print(value);
                },
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 5,
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  hintText: "Phone Number",
                ),
                onChanged: (value) {
                  // this.phoneNo=value;
                  print(value);
                },
              ),
            ),
          ],
        ),
      );
}
