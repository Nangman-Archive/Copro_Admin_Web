import 'dart:convert';
import 'package:copro_admin_web/models/notice_detail_model.dart';
import 'package:copro_admin_web/models/notice_list_model.dart';
import 'package:dio/dio.dart';
import 'package:copro_admin_web/models/token_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoticeServices {
  final String apiBaseUrl =
      dotenv.env['API_BASE_URL'] ?? 'default_value_if_not_present';

  /// Get Notice List API 공지사항 리스트를 가져옵니다.
  Future<NoticeListModel> getNoticeList() async {
    final prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('accessToken');
    var headers = {'Authorization': 'Bearer $accessToken'};

    var dio = Dio();
    var response = await dio.request(
      '$apiBaseUrl/api/board/list/공지사항',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      debugPrint(json.encode(response.data));
      return NoticeListModel.fromJson(response.data);
    } else {
      debugPrint(response.statusMessage);
      return NoticeListModel.fromJson(response.data);
    }
  }

  /// Get Notice Detail API 공지사항 상세정보를 가져옵니다.@param id 공지사항 Board 아이디
  Future<NoticeDetailModel> detailNotice(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('accessToken');
    var headers = {'Authorization': 'Bearer $accessToken'};
    var dio = Dio();
    var response = await dio.request(
      '$apiBaseUrl/api/board?boardId=$id',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      debugPrint(json.encode(response.data));
      return NoticeDetailModel.fromJson(response.data);
    } else {
      debugPrint(response.statusMessage);
      return NoticeDetailModel.fromJson(response.data);
    }
  }

  /// Add Notice API 공지사항을 추가합니다.@param title 제목@param content 내용
  Future<void> addNotice(String title, String content) async {
    final prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('accessToken');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var data = json.encode({"title": title, "contents": content});
    var dio = Dio();
    var response = await dio.request(
      '$apiBaseUrl/api/admin/board',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      debugPrint(json.encode(response.data));
    } else {
      debugPrint(response.statusMessage);
    }
  }

  /// UpdateNotice API 공지사항을 수정합니다.@param id 공지사항 Board 아이디@param title 제목@param content 내용
  Future<void> updateNotice(int id, String title, String content) async {
    final prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('accessToken');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var data = json.encode({"title": title, "contents": content});
    var dio = Dio();
    var response = await dio.request(
      '$apiBaseUrl/api/admin/board?boardId=$id',
      options: Options(
        method: 'PUT',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      debugPrint(json.encode(response.data));
    } else {
      debugPrint(response.statusMessage);
    }
  }

  /// Delete Notice API 공지사항을 삭제합니다.@param id 공지사항 Board 아이디
  Future<void> deleteNotice(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? accessToken = prefs.getString('accessToken');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    var dio = Dio();
    var response = await dio.request(
      '$apiBaseUrl/api/admin/board?boardId=$id',
      options: Options(
        method: 'DELETE',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      debugPrint(json.encode(response.data));
    } else {
      debugPrint(response.statusMessage);
    }
  }
}
