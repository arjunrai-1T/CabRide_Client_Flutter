import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key key}) : super(key: key);
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';

  static const keyRadio = 'key-radio-sync-period';
  static const keyLastSeen = 'key-LastSeen';
  static const keyProfilePhoto = 'key-ProfilePhoto';
  static const keyAbout = 'key-About';
  static const keyStatus = 'key-Status';
  static const keyReadReceipts = 'key-ReadReceipts';
  static const keyGroup = 'key-Group';
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: 'Privacy',
      subtitle: "",
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Icon(
          Icons.privacy_tip,
          color: Colors.white,
        ),
      ),
      onTap: () => {},
      child: SettingsScreen(
        title: 'Privacy',
        children: [],
      ),
    );
  }
}
