import 'package:cab/constants.dart';
import 'package:cab/screens/accountScreen/widget/change_number.dart';
import 'package:cab/screens/accountScreen/widget/delete_account.dart';
import 'package:cab/screens/accountScreen/widget/privacy.dart';
import 'package:cab/screens/accountScreen/widget/request_account_info.dart';
import 'package:cab/screens/accountScreen/widget/security.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class LegalPage extends StatelessWidget {
  const LegalPage({Key key}) : super(key: key);
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyPassword = 'key-password';
  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: "Legal",
      subtitle: "Privacy, Security, Language",
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor,
        ),
        child: Icon(
          Icons.feedback_sharp,
          color: Colors.white,
        ),
      ),
      child: SettingsScreen(
        title: 'Legal',
        children: [
          // xbuildLanguage(),
          // buildLocation(),
          // buildPassword(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Privacy(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Security(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ChangeNumber(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          RequestAccountInfo(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          DeleteAccount(),
        ],
      ),
    );
  }

  Widget buildPassword() => TextInputSettingsTile(
        title: 'Password',
        settingKey: keyPassword,
        obscureText: true,
        validator: (password) => password != "" && password.length >= 6
            ? null
            : 'Enter 6 characters',
      );
  Widget buildLanguage() => DropDownSettingsTile(
        subtitle: "",
        title: 'Language',
        settingKey: keyLanguage,
        selected: 1,
        values: <int, String>{
          0: 'English',
          1: 'Spanish',
          2: 'Chinese',
          3: 'Hindi',
        },
        onChange: (language) {},
      );
}
