import 'dart:async';
import 'package:cab/constants.dart';
import 'package:cab/resfont.dart';
import 'package:cab/screens/authentication/signin.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  SplashView({Key key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 4100),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SignIN(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          // color: Colors.amber,

          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/splash.jpeg",
            ),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Image.asset("assets/images/logo.png"),
            Text(
              'Rider App',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
