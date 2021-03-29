import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic/constant.dart';

import '../searchLocation.dart';
import 'components/body.dart';

class FoodDeliveryScreen extends StatelessWidget {
  static String routeName = "/food_delivery";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: SeachCurrentLocation(
          title: "Restaurant Delivery",
        ),
        buttonStyle: buttonStyle,
      ),
      body: Body(),
    );
  }
}
