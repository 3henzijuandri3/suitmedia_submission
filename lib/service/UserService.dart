import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:suitmedia_submission/model/user_model.dart';
import 'package:suitmedia_submission/shared/values.dart';

class UserService{

  Future<List<UserModel>> getListUser(int page, int limit) async {
    try{

      final res = await http.get(
        Uri.parse('$baseUrl?page=$page&per_page=$limit'),
      );

      List<UserModel> listUser = List<UserModel>.from(
        jsonDecode(res.body)['data'].map(
              (userData) => UserModel.fromJson(userData),
        ),
      );

      return listUser;

    } catch(e) {
      rethrow;
    }
  }
}























