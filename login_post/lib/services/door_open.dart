import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_post/services/login_user.dart';

class OpenDoorService {
  LoginService loginService = LoginService();

  Future<void> openDoor(BuildContext context) async {
    var user =
        "3eivAhQt32vYNjfRJF4jX-Zmcx0aL52-ZUFMAWg4UOzoLvMwQxVzTvwDJj2ptE8mD1cAg0rBUbE0Iu37GydUmg6rLQn7fhE3unM06DVjIFlOu9iVrK0Q03DwH3MDdkBkMfoRZXhpdULfdJQkg8Wn0VuoFZZJ_oONQX4ovyWFGcPz5xKXurSwh-9hYWsK01awQzzVz1b9oj4ZrE9V-x7DAU9UpLuH548Ovq7Ll5a77knFruCPizRFYKVyG84yL-evIGp69SHlrXCFBhpT-PKlP0PlsOzxKU8S-4AhehZFMnY";
    var response = await http.post(
        Uri.parse(
            "http://mobilapi.ucgteknoloji.com/api/MobilApi/SetDoorProcessService"),
        headers: ({
          'Content-Type': 'application/json',
          'Authorization': 'bearer' + user
        }));
    var resultdata = jsonDecode(response.body);
    debugPrint(resultdata['ErrorMessage']);
    if (response.statusCode == 200) {
      debugPrint("İşlem Başarılı Kapı Açıldı.");
    }
  }
}
