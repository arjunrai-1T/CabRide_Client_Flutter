import 'package:cab/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleSettingsTile(
      title: "Help",
      subtitle: "Help center, privacy policy",
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kPrimaryColor,
        ),
        child: Icon(
          Icons.queue_sharp,
          color: Colors.white,
        ),
      ),
      child: SettingsScreen(
        title: 'Help',
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          buildHelpCenter(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          buildContectus(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          buildPrivacypolicy(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          buildAppinfo()
        ],
      ),
    );
  }

  Widget buildHelpCenter() => SimpleSettingsTile(
        title: 'HelpCenter',
        subtitle: "",
        leading: Icon(
          Icons.help,
        ),
        onTap: () => {},
      );
  Widget buildContectus() => SimpleSettingsTile(
        title: 'Contect Us',
        subtitle: "",
        leading: Icon(
          Icons.group,
        ),
        onTap: () => {},
      );
  Widget buildPrivacypolicy() => SimpleSettingsTile(
        title: 'Terms and Privacy Policy',
        subtitle: "",
        leading: Icon(
          Icons.sticky_note_2_outlined,
        ),
        onTap: () => {},
      );
  Widget buildAppinfo() => SimpleSettingsTile(
        title: 'App info',
        subtitle: "",
        leading: Icon(
          Icons.feedback_rounded,
        ),
        onTap: () => {},
      );
}
