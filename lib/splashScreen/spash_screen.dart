import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic/constant.dart';

import '../size_config.dart';
import 'components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/spllash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryBaseLightColor,
      body: Body(),
    );
  }
}
