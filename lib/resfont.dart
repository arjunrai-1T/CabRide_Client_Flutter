import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 99;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
// return LayoutBuilder(
//       builder: (context, constraints) {
//         return OrientationBuilder(
//           builder: (context, orientation) {
//             SizeConfig().init(constraints, orientation);

// import 'package:flutter/cupertino.dart';

// class SizeConfig {
//   static double _screenWidth;
//   static double _screenHeight;
//   static double blockSizeHorizontal = 0;
//   static double blockSizeVertical = 0;

//   static double textMultiplier;
//   static double imageSizeMultiplier;
//   static double heightMultiplier;
//   static double widthMultiplier;
//   static bool isPortrait = true;
//   static bool isMobilePortrait = false;

//   void init(BoxConstraints constraints, Orientation orientation) {
//     if (orientation == Orientation.portrait) {
//       _screenWidth = constraints.maxWidth;
//       _screenHeight = constraints.maxHeight;
//       isPortrait = true;
//       if (_screenWidth < 450) {
//         isMobilePortrait = true;
//       }
//     } else {
//       _screenWidth = constraints.maxHeight;
//       _screenHeight = constraints.maxWidth;
//       isPortrait = false;
//       isMobilePortrait = false;
//     }

//     blockSizeHorizontal = _screenWidth / 100;
//     blockSizeVertical = _screenHeight / 100;

//     textMultiplier = blockSizeVertical;
//     imageSizeMultiplier = blockSizeHorizontal;
//     heightMultiplier = blockSizeVertical;
//     widthMultiplier = blockSizeHorizontal;

//     print(blockSizeHorizontal);
//     print(blockSizeVertical);
//   }
// }
