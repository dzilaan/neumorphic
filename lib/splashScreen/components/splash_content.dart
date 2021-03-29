import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic/constant.dart';

import '../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(
          flex: 2,
        ),
        NeumorphicText(
          'Online Mercado',
          style: NeumorphicStyle(
            color: Colors.blueGrey,
          ),
          textStyle: NeumorphicTextStyle(
              fontSize: getProportionateScreenWidth(50),
              fontWeight: FontWeight.bold),
        ),
        Spacer(),
        NeumorphicText(
          text,
          textAlign: TextAlign.center,
          style: NeumorphicStyle(
            lightSource: LightSource.topLeft,
            intensity: 1,
            surfaceIntensity: 5,
            color: Colors.black,
            depth: 4,
          ),
          textStyle:
              NeumorphicTextStyle(fontSize: getProportionateScreenWidth(18)),
        ),
        Spacer(
          flex: 2,
        ),
        Neumorphic(
          padding: EdgeInsets.all(10),
          style: NeumorphicStyle(
              lightSource: LightSource.topLeft,
              intensity: 1,
              surfaceIntensity: 5,
              shadowLightColor: kShadowLightColor,
              depth: 4),
          child: Image.asset(
            image,
            height: getProportionateScreenHeight(265),
            width: getProportionateScreenWidth(235),
          ),
        ),
        Spacer()
      ],
    );
  }
}
