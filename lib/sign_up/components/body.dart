import 'package:flutter/material.dart';
import 'package:neumorphic/constant.dart';
import 'package:neumorphic/size_config.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "Register Account",
                style: headingStyle,
              ),
              SizedBox(height: getProportionateScreenHeight(5)),
              Text(
                "Complete Details or Register via \nSocial Media.",
                textAlign: TextAlign.center,
              ),
              SignUpForm()
            ],
          ),
        ),
      ),
    );
  }
}
