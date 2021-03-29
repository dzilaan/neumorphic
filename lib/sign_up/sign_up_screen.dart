import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../constant.dart';
import '../size_config.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Text(
            "Sign Up",
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
