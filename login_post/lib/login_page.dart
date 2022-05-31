import 'package:flutter/material.dart';
import 'package:login_post/services/login_user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginService loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginService.emailController,
                decoration: const InputDecoration(
                    labelText: "E-Mail",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: loginService.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email)),
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 45,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    loginService.loginApi(context);
                  },
                  icon: const Icon(
                    Icons.login,
                    size: 18,
                  ),
                  label: const Text("Login"))
            ],
          ),
        )),
      ),
    );
  }
}
