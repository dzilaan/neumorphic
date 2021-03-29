import 'package:flutter/widgets.dart';
import 'package:neumorphic/home/home_screen.dart';
import 'package:neumorphic/sign_in/sign_in_screen.dart';
import 'package:neumorphic/sign_up/sign_up_screen.dart';
import 'package:neumorphic/splashScreen/spash_screen.dart';

import 'fooddelivery/food_delivery.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  FoodDeliveryScreen.routeName: (context) => FoodDeliveryScreen(),
};
