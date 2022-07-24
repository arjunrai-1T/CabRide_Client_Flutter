// @dart=2.9

import 'package:cab/screens/accountScreen/settings_page.dart';
import 'package:cab/screens/states/app_states.dart';
import 'package:cab/screens/welcome/splash.dart';
import 'package:cab/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:provider/provider.dart';

// Future main() async {
//   // WidgetFlutterBinding.ensureInitialized();
//   await Settings.init(cacheProvider: SharePreferenceCache());
//   runApp(MyApp());
// }

Future main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: AppState(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final isDarkMode = Settings.getValue<bool>(SettingsPage.keyDarkMode, true);
    return ValueChangeObserver<bool>(
      cacheKey: SettingsPage.keyDarkMode,
      defaultValue: false,
      builder: (_, isDarkMode, __) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        // theme: isDarkMode ? darkThemeData(context) : lightThemeData(context),
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        home: SplashView(),
      ),
    );
  }
}
