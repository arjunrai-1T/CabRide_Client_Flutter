import 'package:flutter/material.dart';

import '../../../constants.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215,
      width: 215,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user.png"),
          ),
          Positioned(
            right: 12,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: kPrimaryColor),
                  ),
                  // primary: Colors.white,
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {},
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
