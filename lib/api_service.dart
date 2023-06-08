import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_test_1/constants.dart';
import 'package:flutter_test_1/models/user.dart';

class ApiService {
  Future<UserModel> getUser(String userId) async {
    var url = Uri.parse(
        "${ApiConstants.devUrl}${ApiConstants.usersEndpoint}/$userId");
    var response = await http.get(url);
    log("${ApiConstants.devUrl}${ApiConstants.usersEndpoint}/$userId");

    if (response.statusCode == 200) {
      UserModel user = UserModel.fromJson(jsonDecode(response.body));
      return user;
    } else {
      log(response.toString());
      throw Exception("Failed to load user $userId.");
    }
  }
}
