import 'package:cab/screens/accountScreen/widget/change_number_view.dart';
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class ChangeNumber extends StatelessWidget {
  const ChangeNumber({Key key}) : super(key: key);
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyPassword = 'key-password';
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
        title: 'Change Number',
        subtitle: "",
        leading: Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
        ),
        onTap: () => {},
        child: ChangeNumberView());
  }
}
