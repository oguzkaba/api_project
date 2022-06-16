import 'dart:async';
import 'dart:io';

import 'package:api_project/data/api/models/error_model.dart';
import 'package:api_project/data/api/models/login_model.dart';
import 'package:api_project/data/api/models/user_model.dart';
import 'package:api_project/data/api/providers/api_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApiService {
  static const String baseURL = "https://ozak-t.com/api/api-test.php";

//Login
  static Future login(
      String email, String password, BuildContext context) async {
    final ApiProvider apiProvider = Provider.of(context, listen: false);

    Map<String, dynamic> dataMap = {
      'action': 'login',
      'email': email,
      'password': password
    };
    try {
      final response = await http.post(Uri.parse(baseURL), body: dataMap);

      if (response.statusCode == 200) {
        var result = loginModelFromJson(response.body);
        if (result.token == null) {
          apiProvider.setErrorMessage(
              ApiErrorModel(message: result.status.toString()));
        }
        return result;
      } else {
        throw ("İstek durumu başarısız oldu: ${response.statusCode}");
      }
    } on SocketException {
      apiProvider
          .setErrorMessage(ApiErrorModel(message: "No Internet Connection"));
    } on TimeoutException {
      apiProvider.setErrorMessage(ApiErrorModel(message: "Connection timeout"));
    } on Error catch (e) {
      apiProvider.setErrorMessage(ApiErrorModel(message: e.toString()));
    }
  }

//Get User Details
  static Future userDetails(String token, BuildContext context) async {
    final ApiProvider apiProvider = Provider.of(context, listen: false);

    Map<String, dynamic> dataMap = {'action': 'user-details', 'token': token};
    try {
      final response = await http.post(Uri.parse(baseURL), body: dataMap);

      if (response.statusCode == 200) {
        return userModelFromJson(response.body);
      } else {
        throw ("İstek durumu başarısız oldu: ${response.statusCode}");
      }
    } on SocketException {
      apiProvider
          .setErrorMessage(ApiErrorModel(message: "No Internet Connection"));
    } on TimeoutException {
      apiProvider.setErrorMessage(ApiErrorModel(message: "Connection timeout"));
    } on Error catch (e) {
      apiProvider.setErrorMessage(ApiErrorModel(message: e.toString()));
    }
  }
}
