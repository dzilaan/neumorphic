import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'constant.dart';
import 'size_config.dart';

class SeachCurrentLocation extends StatefulWidget {
  final String title;
  SeachCurrentLocation({Key key, @required this.title}) : super(key: key);
  @override
  _SeachCurrentLocationState createState() => _SeachCurrentLocationState();
}

class _SeachCurrentLocationState extends State<SeachCurrentLocation> {
  final Geolocator _geolocator = Geolocator();
  final startAddressController = TextEditingController();
  Position _currentPosition;
  String _currentAddress = "";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title.toString(),
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            color: kPrimaryBaseDarkColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          startAddressController.text,
          style: TextStyle(fontSize: getProportionateScreenWidth(15)),
        )
      ],
    );
  }

  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');
        _getAddress();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddress() async {
    try {
      // Places are retrieved using the coordinates
      List<Placemark> p = await _geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      // Taking the most probable result
      Placemark place = p[0];

      setState(() {
        // Structuring the address
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";

        // Update the text of the TextField
        startAddressController.text = _currentAddress;
        print('CURRENT ADD: $_currentAddress');
        // // Setting the user's present location as the starting address
        // _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }
}
