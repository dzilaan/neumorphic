import 'dart:convert';

import 'package:http/http.dart' as http;

class URLS {
  static const String GetUser = 'http://172.17.18.44:1411/credentials/user/';
  static const String UpdateUser = 'http://172.17.18.44:1411/credentials';
  static const String GetAllRestau =
      'http://172.17.18.44:1411/credentials/allrestaurant/';
  static const String AddRestau =
      'http://172.17.18.44:1411/credentials/restuname';
  // static const String GetUser =
  //     'http://zinslarker-001-site1.etempurl.com/credentials/user/';
  // static const String UpdateUser =
  //     'http://zinslarker-001-site1.etempurl.com/credentials';
}

class ApiService {
  static Future<bool> getUser(String mail, String password) async {
    try {
      final response = await http.get('${URLS.GetUser}$mail/$password');
      if (response.statusCode == 200) {
        if (response.body.contains("false")) {
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<bool> addUser(String fname, String lname, String mail,
      String password, String birthdate, String username) async {
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      String body = jsonEncode(<String, String>{
        "fname": fname,
        "lname": lname,
        "email": mail,
        "password": password,
        "birthdate": birthdate,
        "username": username
      });
      final response = await http.post(
        '${URLS.UpdateUser}',
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        if (response.body.contains(mail)) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<bool> getallRestaurant() async {
    try {
      final response = await http.get('${URLS.GetAllRestau}');
      if (response.statusCode == 200) {
        if (response.body.contains("false")) {
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<bool> addRestaurant(String restauName) async {
    try {
      Map<String, String> headers = {"Content-type": "application/json"};
      String body = jsonEncode(<String, String>{"RestuName": restauName});
      final response = await http.post(
        '${URLS.AddRestau}',
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }
}
