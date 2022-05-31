import 'package:flutter/material.dart';
import 'package:json_api/models/api_model.dart';
import 'package:json_api/models/sevices/user_api_services.dart';

class UserList extends StatefulWidget {
  const UserList({required this.userModel, Key? key}) : super(key: key);

  final UserModel userModel;

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late Future<List<UserModel>> kulModelListe;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kulModelListe = UserApi.getUserData(widget.userModel.id!.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserModel>>(
          future: kulModelListe,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<UserModel> kullaniciListesi = snapshot.data!;
              return ListView.builder(
                  itemBuilder: (context, index) {
                    var listelenenKullanici = kullaniciListesi[index];
                    return Column(
                      children: [
                        Text(listelenenKullanici.name.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(listelenenKullanici.email.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    );
                  },
                  itemCount: kullaniciListesi.length);
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
