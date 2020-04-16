import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;
  IconContent({@required this.cardIcon, @required this.cardText});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          cardIcon,
          size: KIconSize,
        ),
        SizedBox(
          height: KSizedBoxHeight,
        ),
        Text(
          cardText,
          style: KTextStyle,
        ),
      ],
    );
  }
}
