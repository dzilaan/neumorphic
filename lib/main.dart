import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic/route.dart';
import 'package:neumorphic/splashScreen/spash_screen.dart';

import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: kPrimaryBaseLightColor,
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      darkTheme: NeumorphicThemeData(
        baseColor: kPrimaryBaseDarkColor,
        lightSource: LightSource.topLeft,
        depth: 6,
      ),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
