//import 'dart:async';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:neumorphic/size_config.dart';

import '../../social_card.dart';

class SocialMediaLogin extends StatefulWidget {
  @override
  _SocialMediaLoginState createState() => _SocialMediaLoginState();
}

class _SocialMediaLoginState extends State<SocialMediaLogin> {
  // bool _isLogin = false;
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // final _facebookLogin = FacebookLogin();
  // User _user;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: getProportionateScreenWidth(20)),
          Expanded(
            child: SocialCard(
              icon: MdiIcons.google,
              press: () {},
            ),
          ),
          Expanded(
            child: SocialCard(
              icon: MdiIcons.facebook,
              press: () {},
              // press: () async {
              //   await _handleLogin();
              //   if (_isLogin) {
              //     Navigator.pushNamed(context, HomeScreen.routeName);
              //   } else {
              //     showDialog(
              //       builder: (context) => AlertDialog(
              //         title: Text('Error Login Facebook'),
              //         actions: <Widget>[
              //           FlatButton(
              //             onPressed: () {
              //               Navigator.pop(context);
              //             },
              //             child: Text('OK'),
              //           )
              //         ],
              //       ),
              //       context: context,
              //     );
              //   }
              // },
            ),
          ),
          Expanded(
            child: SocialCard(
              icon: MdiIcons.twitter,
              press: () {},
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
        ],
      ),
    );
  }

  // Future _handleLogin() async {
  //   FacebookLoginResult _result = await _facebookLogin.logIn(['email']);

  //   switch (_result.status) {
  //     case FacebookLoginStatus.cancelledByUser:
  //       print("CancelledByUser");
  //       break;
  //     case FacebookLoginStatus.error:
  //       print("ErrorFb");
  //       break;
  //     case FacebookLoginStatus.loggedIn:
  //       await _loginWithFacebook(_result);
  //       break;
  //   }
  // }

  // Future _loginWithFacebook(FacebookLoginResult _result) async {
  //   FacebookAccessToken _accessToken = _result.accessToken;
  //   AuthCredential _credential =
  //       FacebookAuthProvider.credential(_accessToken.token);
  //   var a = await _auth.signInWithCredential(_credential);
  //   setState(() {
  //     _isLogin = true;
  //     _user = a.user;
  //   });
  // }

  // Future _signOut() async {
  //   await _auth.signOut().then((value) {
  //     setState(() {
  //       _facebookLogin.logOut();
  //       _isLogin = false;
  //     });
  //   });
  // }
}
