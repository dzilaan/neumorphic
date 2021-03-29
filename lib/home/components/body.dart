import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic/fooddelivery/food_delivery.dart';
import 'package:neumorphic/size_config.dart';

import '../../constant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

TimeOfDay now = TimeOfDay.now();

final _restu = new TextEditingController();

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Divider(
              thickness: 2,
              height: getProportionateScreenHeight(10),
            ),
            SizedBox(
              height: getProportionateScreenHeight(130),
              child: Row(
                children: [
                  SizedBox(width: getProportionateScreenWidth(30)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          greetings1(),
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(25),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          greetings2(),
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    greetingsImage(),
                    scale: getProportionateScreenWidth(4),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(350),
              child: Column(
                children: <Widget>[
                  TextFieldSearch(),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Container(
                    width: double.infinity,
                    height: getProportionateScreenHeight(150),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff296342),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                          child: Image.asset("assets/images/fooddev.png"),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Food Delivery",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: getProportionateScreenWidth(18),
                              ),
                            ),
                            Text(
                              "Order food you love",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: getProportionateScreenWidth(10)),
                            NeumorphicButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, FoodDeliveryScreen.routeName);
                              },
                              style: NeumorphicStyle(
                                border: NeumorphicBorder(
                                  color: kPrimaryBaseLightColor,
                                ),
                                shape: NeumorphicShape.convex,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(25)),
                                lightSource: LightSource.topLeft,
                                shadowLightColor: Colors.transparent,
                                intensity: 1,
                                surfaceIntensity: .2,
                                depth: 8,
                                color: kPrimaryBaseLightColor,
                              ),
                              child: Row(
                                children: [
                                  Text("Order now"),
                                  SizedBox(child: Icon(Icons.arrow_right))
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),
                      ],
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: getProportionateScreenHeight(150),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xff294c63),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 40,
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Image.asset(
                                    "assets/images/bagfull.png",
                                    scale: 3,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: getProportionateScreenWidth(5),
                                top: getProportionateScreenHeight(70),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Shops",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize:
                                            getProportionateScreenWidth(18),
                                      ),
                                    ),
                                    Text(
                                      "Groceries\nand more",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(15)),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: getProportionateScreenHeight(150),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xff6695ad),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                right: getProportionateScreenWidth(20),
                                child: Image.asset(
                                  "assets/images/chickInHand-removebg-preview.png",
                                  scale: 3,
                                ),
                              ),
                              Positioned(
                                right: getProportionateScreenWidth(10),
                                top: getProportionateScreenHeight(70),
                                child: Column(
                                  children: [
                                    Text(
                                      "Pick-up",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize:
                                            getProportionateScreenWidth(18),
                                      ),
                                    ),
                                    Text(
                                      "Get up to\n30% off",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
            Container(
              width: getProportionateScreenWidth(350),
              height: getProportionateScreenHeight(100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.red,
                image: DecorationImage(
                  image: AssetImage("assets/images/foods101.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  "ORDER NOW!!",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: getProportionateScreenWidth(50),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(15)),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Neumorphic TextFieldSearch() {
    return Neumorphic(
      child: TextFormField(
        controller: _restu,
        decoration: InputDecoration(
          labelText: "Search",
          hintText: "Restaurants & Shops",
          contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryBaseLightColor,
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryBaseLightColor,
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          border: outlineInputBorder,
          // if you are using latest version of flutter then label text and hint text shown like
          // if you are using flutter old  1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: NeumorphicIcon(
              Icons.search,
              size: 45,
              style: NeumorphicStyle(
                depth: 8,
                border: NeumorphicBorder(color: kTextColor),
                shadowLightColor: kShadowLightColor,
                color: kTextColor,
              ),
            ),
          ),
        ),
      ),
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
          shadowLightColor: kShadowLightColor,
          depth: 10,
          shape: NeumorphicShape.convex,
          surfaceIntensity: .2,
          intensity: 1),
    );
  }

  String greetings2() {
    if (now.format(context).toString().contains("AM")) {
      if (now.hourOfPeriod > 5)
        return "Breakfast time? Order now for\nnumnum foods!";
      else
        return "Midnight Snack time? Order now for\nnumnum foods!";
    } else {
      if (now.hourOfPeriod == 12 || now.hourOfPeriod < 2)
        return "Lunch time? Order numnum\nfoods now!";
      else if (now.hourOfPeriod < 5 && now.minute <= 59)
        return "Snack time? Order numnum\nfoods now!";
      else if (now.hourOfPeriod > 9)
        return "Snack time? Order numnum\nfoods now!";
      else
        return "Dinner time? Order numnum\nfoods now!";
    }
  }

  String greetingsImage() {
    if (now.format(context).toString().contains("AM")) {
      if (now.hourOfPeriod > 5)
        return "assets/images/bfast.png";
      else
        return "assets/images/snacks.png";
    } else {
      if (now.hourOfPeriod == 12 || now.hourOfPeriod < 2)
        return "assets/images/lunch.png";
      else if (now.hourOfPeriod < 5 && now.minute <= 59)
        return "assets/images/snacks.png";
      else if (now.hourOfPeriod > 9)
        return "assets/images/snacks.png";
      else
        return "assets/images/dinner.png";
    }
  }

  String greetings1() {
    if (now.format(context).toString().contains("AM")) {
      if (now.hourOfPeriod > 5)
        return "Morning,";
      else
        return "Evening,";
    } else {
      if (now.hourOfPeriod == 12 || now.hourOfPeriod < 2)
        return "Afternoon,";
      else if (now.hourOfPeriod < 5 && now.minute <= 59)
        return "Afternoon,";
      else if (now.hourOfPeriod > 9)
        return "Evening,";
      else
        return "Evening,";
    }
  }
}
