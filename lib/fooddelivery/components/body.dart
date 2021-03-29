import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic/components/api_request.dart';

import '../../constant.dart';
import '../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

final _restu = new TextEditingController();

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    _getallRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 2,
          height: getProportionateScreenHeight(10),
        ),
        Expanded(
          child: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 25),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextFieldFind(),
                      ),
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: getProportionateScreenWidth(350),
                      height: getProportionateScreenHeight(180),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage("assets/images/jollibeeBG.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: getProportionateScreenWidth(165),
                            left: getProportionateScreenWidth(5),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Text(
                                " 20 min ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    SizedBox(
                      width: getProportionateScreenWidth(350),
                      height: getProportionateScreenHeight(45),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Jollibee - Island Central Pusok",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text("★4.8(255)"),
                            ],
                          ),
                          Text("₱₱ Asian, Epic Deals 5, New to Pick-Up")
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Container(
                      width: getProportionateScreenWidth(350),
                      height: getProportionateScreenHeight(180),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage("assets/images/mcdonaldsBG.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: getProportionateScreenWidth(165),
                            left: getProportionateScreenWidth(5),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Text(
                                " 18 min ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    SizedBox(
                      width: getProportionateScreenWidth(350),
                      height: getProportionateScreenHeight(50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "McDonalds - Maximo V. Patalinghug Jr. Avenue, Lapu-Lapu City, Cebu",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text("★4.5(350)"),
                            ],
                          ),
                          Text("₱₱ Asian, Epic Deals 5, New to Pick-Up")
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Container(
                      width: getProportionateScreenWidth(350),
                      height: getProportionateScreenHeight(180),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage("assets/images/cookpubBG.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: getProportionateScreenWidth(165),
                            left: getProportionateScreenWidth(5),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Text(
                                " 32 min ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    SizedBox(
                      width: getProportionateScreenWidth(350),
                      height: getProportionateScreenHeight(50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "CookPub - 8XGG+GG Lapu-Lapu City, Cebu",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text("★5.0(42)"),
                            ],
                          ),
                          Text("₱₱ Asian, Epic Deals 5, New to Pick-Up")
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Container(
                      width: getProportionateScreenWidth(350),
                      height: getProportionateScreenHeight(180),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage("assets/images/manginasalBG.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: getProportionateScreenWidth(165),
                            left: getProportionateScreenWidth(5),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Text(
                                " 30 min ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    SizedBox(
                      width: getProportionateScreenWidth(350),
                      height: getProportionateScreenHeight(50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Mang Inasal - Mactan Marina Mall, MEPZ 1, Lapu-Lapu City, 6015",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text("★4.4(169)"),
                            ],
                          ),
                          Text("₱₱ Asian, Epic Deals 5, New to Pick-Up")
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Container(
                      width: getProportionateScreenWidth(350),
                      height: getProportionateScreenHeight(180),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image:
                              AssetImage("assets/images/balambanliempoBG.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: getProportionateScreenWidth(165),
                            left: getProportionateScreenWidth(5),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Text(
                                " 12 min ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    SizedBox(
                      width: getProportionateScreenWidth(350),
                      height: getProportionateScreenHeight(50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Balamban Liempo - Quezon National Hwy, Lapu-Lapu City, 6015 Cebu",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text("★4.0(55)"),
                            ],
                          ),
                          Text("₱₱ Asian, Epic Deals 5, New to Pick-Up")
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Container(
                      width: getProportionateScreenWidth(350),
                      height: getProportionateScreenHeight(180),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage("assets/images/kfcBG.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: getProportionateScreenWidth(165),
                            left: getProportionateScreenWidth(5),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Text(
                                " 15 min ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    SizedBox(
                      width: getProportionateScreenWidth(350),
                      height: getProportionateScreenHeight(50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "KFC - Unit 20 21, 168 Park Mall Dr, Road, Mandaue City, 6014 Cebu",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Text("★5.0(88)"),
                            ],
                          ),
                          Text("₱₱ Asian, Epic Deals 5, New to Pick-Up")
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                  ],
                ),
              )),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Neumorphic TextFieldFind() {
    return Neumorphic(
      child: TextFormField(
        controller: _restu,
        decoration: InputDecoration(
          hintText: "Find something you like",
          hintStyle: TextStyle(fontSize: getProportionateScreenWidth(15)),
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

  _getallRestaurant() {
    ApiService.getallRestaurant().then((success) {
      if (success) {
      } else {}
    });
  }
}
