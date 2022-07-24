import 'package:cab/constants.dart';
import 'package:cab/resfont.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.icon, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: kPrimaryColor,
              size: 3.5 * SizeConfig.blockSizeVertical,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 2 * SizeConfig.blockSizeVertical,
                // color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
  }
}
