import 'package:flutter/material.dart';
import 'package:json_api/models/api_model.dart';
import 'package:json_api/models/sevices/user_api_services.dart';
import 'package:json_api/pages/user_list.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'scanner_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late List<UserModel> _userModelList;
  late String _result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Uygulaması"),
      ),
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              _openScanner(context);
            },
            child: const Icon(Icons.abc))
      ]),
    );
  }

  Future _openScanner(BuildContext context) async {
    final Barcode result = await Navigator.push(
        context, MaterialPageRoute(builder: ((context) => const Scanner())));
    setState(() {
      _result = result.code.toString();
    });
  }
}
