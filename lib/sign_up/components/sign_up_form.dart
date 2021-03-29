import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';
import '../../form_error.dart';
import '../../size_config.dart';

String fname;
String lname;

final List<String> errors = [];
final _formKey = GlobalKey<FormState>();

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController dateCtl = TextEditingController();
  String userName;
  DateTime birthdate = DateTime.now();
  String email;
  String password;
  String confirmPassword;

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
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(10)),
              TextFieldUsername(),
              Row(
                children: [
                  Expanded(child: TextFieldFistName()),
                  Expanded(child: TextFieldLastName()),
                ],
              ),
              TextFieldBirthDate(),
              TextFieldEmail(),
              TextFieldPassword(),
              TextFieldConfirmPassword(),
              SizedBox(height: getProportionateScreenHeight(15)),
              FormError(errors: errors),
              SizedBox(height: getProportionateScreenHeight(15)),
              SizedBox(
                width: getProportionateScreenWidth(300),
                child: DefaultNeuButton(
                  text: "Sign Up",
                  press: () {
                    if (_formKey.currentState.validate())
                      _formKey.currentState.save();
                  },
                  widthText: 30,
                  padding: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != birthdate) {
      DateFormat formatter = DateFormat('yyyy-MM-dd');
      String formatted = formatter.format(picked);
      setState(() {
        dateCtl.text = formatted;
      });
    }
  }

  // ignore: non_constant_identifier_names
  Neumorphic TextFieldBirthDate() {
    return Neumorphic(
      child: TextFormField(
        controller: dateCtl,
        onTap: () {
          _selectDate(context);
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        onChanged: (value) {
          if (value.isNotEmpty || value == DateTime.now().toIso8601String()) {
            removeError(error: kBirthDateNullError);
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty || value == DateTime.now().toIso8601String()) {
            addError(error: kBirthDateNullError);
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Birth Date",
          hintText: "Enter your Birth Date",
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
        depth: -10,
        shape: NeumorphicShape.convex,
        intensity: 1,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Neumorphic TextFieldFistName() {
    return Neumorphic(
      child: TextFormField(
        onSaved: (newValue) => lname = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kFirstNameNullError);
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kFirstNameNullError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "First",
          hintText: "Name",
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
        depth: 8,
        shape: NeumorphicShape.concave,
        intensity: 1,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Neumorphic TextFieldLastName() {
    return Neumorphic(
      child: TextFormField(
        onSaved: (newValue) => fname = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kLastnameNullError);
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kLastnameNullError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Last",
          hintText: "Name",
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
        depth: 8,
        shape: NeumorphicShape.concave,
        intensity: 1,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Neumorphic TextFieldUsername() {
    return Neumorphic(
      child: TextFormField(
        onSaved: (newValue) => userName = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kUserNameNullError);
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kUserNameNullError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Username",
          hintText: "Enter your Username",
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
        depth: -10,
        shape: NeumorphicShape.concave,
        surfaceIntensity: 1,
        intensity: 1,
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
            return "";
          } else if (emailValidatorRegExp.hasMatch(value)) {
            removeError(error: kInvalidEmailError);
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kEmailNullError);
            return "";
          } else if (!emailValidatorRegExp.hasMatch(value.trim())) {
            addError(error: kInvalidEmailError);
            return "";
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
        intensity: 1,
      ),
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
            return "";
          } else if (value.length >= 8) {
            removeError(error: kShortPassError);
            return "";
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if (value.length < 8) {
            addError(error: kShortPassError);
            return "";
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
        depth: -10,
        shape: NeumorphicShape.convex,
        surfaceIntensity: .2,
        intensity: 1,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Neumorphic TextFieldConfirmPassword() {
    return Neumorphic(
      child: TextFormField(
        obscureText: true,
        onSaved: (newValue) => confirmPassword = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kConPassNullError);
          } else if (value.length >= 8) {
            removeError(error: kShortPassError);
          } else if (value == password) {
            addError(error: kSamePassError);
          }
          return null;
        },
        validator: (value) {
          if (value.isEmpty) {
            addError(error: kConPassNullError);
          } else if (value.length < 8) {
            addError(error: kShortPassError);
          } else if (value == password) {
            removeError(error: kSamePassError);
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

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kPrimaryBaseLightColor),
    gapPadding: 10,
  );
}
