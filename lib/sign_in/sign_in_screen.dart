import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic/constant.dart';

import '../size_config.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/signIn_screen";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Text(
            "Sign In",
            style: TextStyle(fontSize: getProportionateScreenWidth(22)),
          ),
        ),
        buttonStyle: buttonStyle,
      ),
      backgroundColor: kPrimaryBaseLightColor,
      body: Body(),
    );
  }
}
