import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic/home/home_screen.dart';
import 'package:neumorphic/size_config.dart';

import '../../constant.dart';
import '../../form_error.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  bool isSuccess;
  String email;
  String password;
  bool remember = false;
  bool isLoggedIn = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFieldEmail(),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFieldPassword(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            children: [
              NeumorphicCheckbox(
                style: NeumorphicCheckboxStyle(
                  selectedDepth: 10,
                  unselectedDepth: 10,
                  selectedColor: kPrimaryBaseDarkColor,
                  lightSource: LightSource.topLeft,
                ),
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          SizedBox(
              width: getProportionateScreenWidth(350),
              child: FormError(errors: errors)),
          SizedBox(height: getProportionateScreenHeight(10)),
          SizedBox(
            width: getProportionateScreenWidth(300),
            child: DefaultNeuButton(
              text: "LOGIN",
              press: () {
                // if (_formKey.currentState.validate()) {
                //   _formKey.currentState.save();
                //   // ApiService.getUser(
                //   //         email.toLowerCase().toString().trim(), password.trim())
                //   //     .then((success) {
                //   //   if (success) {
                //   //     Navigator.pushNamed(context, HomeScreen.routeName);
                //   //   } else {
                //   //     showDialog(
                //   //       builder: (context) => AlertDialog(
                //   //         title: Text('Incorrect Username/Passowrd'),
                //   //         actions: <Widget>[
                //   //           FlatButton(
                //   //             onPressed: () {
                //   //               Navigator.pop(context);
                //   //             },
                //   //             child: Text('OK'),
                //   //           )
                //   //         ],
                //   //       ),
                //   //       context: context,
                //   //     );
                //   //   }
                //   // });
                // }
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  if (errors.length == 0)
                    Navigator.pushNamed(context, HomeScreen.routeName);
                }
              },
              widthText: 25,
              fontWeight: FontWeight.w400,
              padding: 13,
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Neumorphic TextFieldEmail() {
    return Neumorphic(
      child: TextFormField(
        onSaved: (newValue) => email = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kEmailNullError);
          } else if (emailValidatorRegExp.hasMatch(value)) {
            removeError(error: kInvalidEmailError);
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kEmailNullError);
          } else if (!emailValidatorRegExp.hasMatch(value.trim())) {
            addError(error: kInvalidEmailError);
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your Email Address",
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
          suffixIcon: NeumorphicIcon(
            Icons.mail,
            size: 45,
            style: NeumorphicStyle(
              depth: 8,
              border: NeumorphicBorder(color: kTextColor),
              shadowLightColor: kShadowLightColor,
            ),
          ),
        ),
      ),
      style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(28)),
          shadowLightColor: kShadowLightColor,
          depth: 10,
          shape: NeumorphicShape.convex,
          surfaceIntensity: .2,
          intensity: 1),
    );
  }

  // ignore: non_constant_identifier_names
  Neumorphic TextFieldPassword() {
    return Neumorphic(
      child: TextFormField(
        obscureText: true,
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (!value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.length >= 8) {
            removeError(error: kShortPassError);
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kPassNullError);
          } else if (value.length < 8) {
            addError(error: kShortPassError);
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Password",
          hintText: "Enter your Password",
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
          suffixIcon: NeumorphicIcon(
            Icons.lock,
            size: getProportionateScreenWidth(45),
            style: NeumorphicStyle(
              depth: 4,
              border: NeumorphicBorder(color: kTextColor),
              shadowLightColor: kShadowLightColor,
            ),
          ),
        ),
      ),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(28)),
        shadowLightColor: kShadowLightColor,
        depth: 10,
        shape: NeumorphicShape.concave,
        surfaceIntensity: .2,
        intensity: 1,
      ),
    );
  }
}
