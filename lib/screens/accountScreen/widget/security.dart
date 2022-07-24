import 'package:cab/constants.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class Security extends StatelessWidget {
  const Security({Key key}) : super(key: key);
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyPassword = 'key-password';
  static const keyecurityNotification = 'key-ecurityNotification';
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Security',
      subtitle: "",
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green.shade400,
        ),
        child: Icon(
          Icons.security,
          color: Colors.white,
        ),
      ),
      onTap: () => {},
      child: SettingsScreen(
        title: 'Security',
        children: [
          buildsecurityLogo(),
          buildsecurityInfo(),
          SizedBox(
            height: 15,
          ),
          buildSecurityNotification()
        ],
      ),
    );
  }

  Widget buildsecurityLogo() => Container(
        padding: EdgeInsets.fromLTRB(10, 25, 10, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: kPrimaryColor.withOpacity(0.3),
              minRadius: 80,
              child: Icon(
                Icons.security_rounded,
                color: kPrimaryColor,
                size: 100,
              ),
            )
          ],
        ),
      );
  Widget buildsecurityInfo() => Container(
        padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
        child: Text(
          "End-to-end encryption ensures only you and the person you're communicating with can read or listen to what is sent, and nobody in between, not even CAB. This is because with end-to-end encryption, your messages are secured with a lock.",
          style: TextStyle(fontSize: 17),
        ),
      );
  Widget buildSecurityNotification() => SwitchSettingsTile(
        title: "Show Security Notification",
        subtitle:
            "if turned off, you won't send or receive Read receipts. Read receipts always sent for group CAB.",
        settingKey: keyecurityNotification,
      );
}
