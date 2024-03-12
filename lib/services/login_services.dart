import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:copro_admin_web/models/token_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginServices {
  Future<bool> getAccessToken(idToken) async {
    final String apiBaseUrl =
        dotenv.env['API_BASE_URL'] ?? 'default_value_if_not_present';
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({"authCode": "$idToken"});
    var dio = Dio();
    var response = await dio.request(
      '$apiBaseUrl/api/google/token',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      final data = TokenModel.fromJson(response.data);
      final accessToken = data.data!.accessToken;
      final refreshToken = data.data!.refreshToken;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('accessToken', accessToken!);
      await prefs.setString('refreshToken', refreshToken!);
      debugPrint("${prefs.getString('accessToken')}");
      debugPrint("${prefs.getString('refreshToken')}");
      return true;
    } else {
      debugPrint(response.statusMessage);
      return false;
    }
  }
}
