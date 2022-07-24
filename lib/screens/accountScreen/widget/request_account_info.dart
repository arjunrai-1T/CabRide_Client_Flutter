import 'package:cab/constants.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class RequestAccountInfo extends StatelessWidget {
  const RequestAccountInfo({Key key}) : super(key: key);
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyPassword = 'key-password';
  static const keyecurityNotification = 'key-ecurityNotification';
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Request to Account Info',
      subtitle: "",
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Icon(
          Icons.sticky_note_2_outlined,
          color: Colors.white,
        ),
      ),
      onTap: () => {},
      child: SettingsScreen(
        title: 'Request Account Info',
        children: [
          buildReceiptLogo(),
          buildAccountReceiptInfo(),
          SizedBox(
            height: 15,
          ),
          buildDownloadReport()
        ],
      ),
    );
  }

  Widget buildReceiptLogo() => Container(
        padding: EdgeInsets.fromLTRB(10, 25, 10, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: kPrimaryColor.withOpacity(0.3),
              minRadius: 80,
              child: Icon(
                Icons.note,
                color: kPrimaryColor,
                size: 100,
              ),
            )
          ],
        ),
      );
  Widget buildAccountReceiptInfo() => Container(
        padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
        child: Text(
          "End-to-end encryption ensures only you and the person you're communicating with can read or listen to what is sent, and nobody in between, not even CAB. This is because with end-to-end encryption, your messages are secured with a lock.",
          style: TextStyle(fontSize: 17),
        ),
      );
  Widget buildDownloadReport() => SimpleSettingsTile(
        title: "Download report",
        subtitle: 'january 16, 2022 , 84kb',
        leading: Icon(Icons.download_rounded),
      );
}
