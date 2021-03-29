import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'constant.dart';

import 'size_config.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({
    Key key,
    this.icon,
    this.press,
  }) : super(key: key);

  final IconData icon;
  final Function press;

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: press,
    //   child: Container(
    //     margin:
    //         EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
    //     padding: EdgeInsets.all(getProportionateScreenWidth(10)),
    //     height: getProportionateScreenHeight(50),
    //     width: getProportionateScreenWidth(50),
    //     decoration: BoxDecoration(
    //       color: Color(0xFFF5F6F9),
    //       shape: BoxShape.circle,
    //     ),
    //     child: Icon(icon),
    //   ),
    // );
    return GestureDetector(
      onTap: press,
      child: NeumorphicIcon(
        icon,
        size: getProportionateScreenWidth(55),
        style: NeumorphicStyle(
          border: NeumorphicBorder(
            color: kTextColor,
          ),
          shadowLightColor: kShadowLightColor,
          depth: 8,
          color: kPrimaryBaseDarkColor,
          intensity: 1,
          surfaceIntensity: .5,
          shape: NeumorphicShape.convex,
        ),
      ),
    );
  }
}
