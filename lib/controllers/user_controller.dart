import 'dart:convert';
import 'package:flutter_log_reg/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/api_endpoints.dart';

class UserController extends GetxController {
  var users = <Users>[];
  var isLoading = false.obs;

  Future<List<Users>> fetchUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var response = await http.get(
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.userList.userList),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return (data['data'] as List).map((e) => Users.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }
}
