import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsPage1 extends StatelessWidget {
  static const keyDarkMode = 'key-darkmode';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.51),
          buildDarkMode(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        ],
      ),
    );
  }

  Widget buildDarkMode() => SwitchSettingsTile(
        title: 'Dark Mode',
        settingKey: keyDarkMode,
        leading: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF642ef3),
          ),
          child: Icon(
            Icons.toggle_on,
            color: Colors.white,
          ),
        ),
      );
}
