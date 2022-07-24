import 'package:cab/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class ChatsSettings extends StatelessWidget {
  const ChatsSettings({Key key}) : super(key: key);
  static const keyEnterSend = 'key-EnterSend';
  static const keyMediaVisibility = 'key-MediaVisibility';
  static const keyChatArchived = 'key-ChatArchived';
  static const keyFontSize = 'key-FontSize';
  static const keyLanguage = 'key-Language';
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: "Messages",
      subtitle: "Messages from Application",
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor,
        ),
        child: Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      child: SettingsScreen(
        title: 'Messages',
        children: [],
      ),
    );
  }
}
