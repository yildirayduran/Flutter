import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const DarkLightTheme();
  }
}

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({
    Key? key,
  }) : super(key: key);

  @override
  State<DarkLightTheme> createState() => _DarkLightThemeState();
}

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.green,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange),
);

ThemeData _darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(color: Colors.purple),
  toggleableActiveColor: Colors.red,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
      .copyWith(secondary: Colors.orange, brightness: Brightness.dark),
);
bool _light = false;

class _DarkLightThemeState extends State<DarkLightTheme> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _light ? _lightTheme : _darkTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: _darkTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dark Light Theme (+5 Points)"),
        ),
        body: Center(
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(labelText: "Enter Me"),
              ),
              RaisedButton(
                onPressed: () {},
                child: const Text("Click Me"),
              ),
              Switch(
                value: _light,
                onChanged: (state) {
                  setState(() {
                    _light = state;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
