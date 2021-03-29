import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../constant.dart';
import '../searchLocation.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        buttonStyle: buttonStyle,
        title: SeachCurrentLocation(
          title: "Current Location",
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [],
        ),
      ),
      body: Body(),
    );
  }
}
