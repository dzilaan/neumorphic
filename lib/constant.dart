import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neumorphic/size_config.dart';

const kPrimaryColor = Color(0xFFe8f6ff);
const kPrimaryLightColor = Color(0xFFebf2ff);
const kPrimaryBaseLightColor = Color(0xFFbcc6cc);
const kPrimaryBaseDarkColor = Color(0xFF3E3E3E);
const kTextcolor = Color(0xFFebf4fa);
const kShadowLightColor = Color(0xFFd1e0e8);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF212426);

const kPrimaryGreyColor = Color(0xFFededed);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^\w+[\w-\.]*\@\w+((-\w+)|(\w*))\.[a-z]{2,3}$");
final RegExp userValidatorRegExp = RegExp(r"^[a-zA-Z0-9]");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kFirstNameNullError = "Please Enter your First Name";
const String kUserNameNullError = "Please Enter your desired User Name";
const String kLastnameNullError = "Please Enter your Last Name";
const String kConPassNullError = "Please Re-enter your password";
const String kSamePassError = "Password are not the same!";
const String kBirthDateNullError = "Please enter your birthdate";

NeumorphicStyle buttonStyle = NeumorphicStyle(
  border: NeumorphicBorder(
    color: kPrimaryBaseLightColor,
  ),
  shape: NeumorphicShape.convex,
  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(25)),
  lightSource: LightSource.topLeft,
  shadowLightColor: kShadowLightColor,
  intensity: 1,
  surfaceIntensity: .2,
  depth: 8,
  color: kPrimaryBaseLightColor,
);

class DefaultNeuButton extends StatelessWidget {
  const DefaultNeuButton({
    Key key,
    this.text,
    this.press,
    this.widthText,
    this.fontWeight,
    this.padding,
  }) : super(key: key);

  final String text;
  final Function press;
  final double widthText;
  final FontWeight fontWeight;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: press,
      style: buttonStyle,
      padding: EdgeInsets.all(padding),
      child: NeumorphicText(
        text,
        style: NeumorphicStyle(
          color: kTextColor,
          shadowLightColor: kShadowLightColor,
        ),
        textStyle: NeumorphicTextStyle(
          fontSize: getProportionateScreenWidth(widthText),
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(28),
  borderSide: BorderSide(color: kPrimaryBaseLightColor),
  gapPadding: 10,
);
