import 'dart:convert';

import 'package:copro_admin_web/models/member_list_model.dart';
import 'package:copro_admin_web/utils/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemberServices {
  String apiBaseUrl = Env().apiBaseUrl;
  // final String apiBaseUrl =
  //     dotenv.env['API_BASE_URL'] ?? 'default_value_if_not_present';
  Future<MemberListModel> getMemberList(int page) async {
    final prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('accessToken');
    var headers = {'Authorization': 'Bearer $accessToken'};
    var dio = Dio();
    var response = await dio.request(
      '$apiBaseUrl/api/admin/infos?page=$page&size=10',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      return MemberListModel.fromJson(response.data);
    } else {
      debugPrint(response.statusMessage);
      return MemberListModel.fromJson(response.data);
    }
  }
}
