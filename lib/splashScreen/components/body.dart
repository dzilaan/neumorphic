import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic/constant.dart';
import 'package:neumorphic/sign_in/sign_in_screen.dart';

import '../../size_config.dart';
import 'splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"image": "assets/images/shoe-shop.png", "text": "Welcome, Let's Shop!"},
    {
      "image": "assets/images/laptop.png",
      "text": "We help people connect with store \naround Philippines"
    },
    {
      "image": "assets/images/shopping.png",
      "text": "We show the easy way to shop. \nJust stay at home with us"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]["text"],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  Spacer(flex: 1),
                  SizedBox(
                    width: getProportionateScreenWidth(300),
                    height: getProportionateScreenHeight(65),
                    child: DefaultNeuButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                      widthText: 30,
                      fontWeight: FontWeight.bold,
                      padding: 13,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kTextColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
