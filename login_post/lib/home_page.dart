import 'package:flutter/material.dart';
import 'package:login_post/services/door_open.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  OpenDoorService openDoorService = OpenDoorService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("HoşGeldiniz"),
            OutlinedButton.icon(
                onPressed: () {
                  openDoorService.openDoor(context);
                },
                icon: const Icon(
                  Icons.exit_to_app_outlined,
                  size: 18,
                ),
                label: const Text("Kapı Aç"))
          ],
        ),
      ),
    );
  }
}
