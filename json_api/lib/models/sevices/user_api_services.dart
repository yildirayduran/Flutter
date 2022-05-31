import 'package:dio/dio.dart';
import 'package:json_api/models/api_model.dart';

class UserApi {
  static const String _url = "https://jsonplaceholder.typicode.com/users";

  static Future<List<UserModel>> getUserData(int id) async {
    List<UserModel> _list = [];
    var result = await Dio().get(_url);
    var apiList = result.data;

    if (apiList is List) {
      _list = apiList.map((e) => UserModel.fromJson(e)).toList();
    }
    UserModel _userData = _list.firstWhere((user) => user.id == id);
    return [_userData];
  }
}
