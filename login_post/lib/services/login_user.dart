import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../home_page.dart';

class LoginService {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> loginApi(BuildContext context) async {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://mobilapi.ucgteknoloji.com/Register"),
          body: ({
            'UserName': emailController.text,
            'Password': passwordController.text,
            'grant_type': 'password',
          }));
      var resultdata = jsonDecode(response.body);
      debugPrint(resultdata['access_token']);
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Geçersiz Kullanıcı Adı")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("İzin verilmez")));
    }
  }
}
