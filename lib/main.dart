import 'package:copro_admin_web/models/notice_detail_model.dart';
import 'package:copro_admin_web/screens/edit_notice_board.dart';
import 'package:copro_admin_web/screens/notice_add.dart';
import 'package:copro_admin_web/screens/notice_detail.dart';
import 'package:copro_admin_web/screens/home.dart';
import 'package:copro_admin_web/screens/login.dart';
import 'package:copro_admin_web/screens/notice_edit.dart';
import 'package:copro_admin_web/screens/notice_list.dart';
import 'package:copro_admin_web/services/notice_services.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in_web_redirect/google_sign_in_web_redirect.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// late SharedPreferences sharedPreferences;

void main() async {
  GoogleSignWeb.getQueryParameters();

  ///make sure add this line
  setPathUrlStrategy();

  // .env 파일을 로드
  await dotenv.load();

  ///make sure add this line
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // GoRouter 인스턴스를 생성합니다.
  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(), // 초기 라우트로 이동
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/add_notice',
        builder: (context, state) => const NoticeAddScreen(),
      ),
      GoRoute(
        path: '/list_notice',
        builder: (context, state) => const NoticeListScreen(),
      ),
      GoRoute(
        path: '/detail_notice/:id', // 경로에 :id 파라미터 포함
        builder: (context, state) {
          final id = int.tryParse(
              state.pathParameters['id'] ?? ''); // 경로에서 id 파라미터 값 가져오기
          return DetailNoticeScreen(id: id);
        },
      ),
      GoRoute(
        path: '/edit_notice',
        builder: (context, state) {
          final notice = state.extra! as Data;
          return NoticeEditScreen(notice: notice);
        },
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Copro Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
