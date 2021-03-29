import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic/size_config.dart';

import '../../constant.dart';
import '../../no_account_text.dart';
import 'sign_form.dart';
import 'social_media_login.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(35)),
              Text(
                "Welcome Back",
                style: TextStyle(
                  color: kPrimaryBaseDarkColor,
                  fontSize: getProportionateScreenWidth(30),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(
                "Sign in with your email and password \nor continue with social media",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryBaseDarkColor,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(50)),
              SignForm(),
              SizedBox(height: getProportionateScreenHeight(20)),
              SocialMediaLogin(),
              SizedBox(height: getProportionateScreenHeight(25)),
              NoAccountText(),
            ],
          ),
        ),
      ),
    ));
  }
}
