import 'package:copro_admin_web/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in_web_redirect/google_sign_in_web_redirect.dart';
import 'package:url_strategy/url_strategy.dart';

// late SharedPreferences sharedPreferences;

void main() async {
  GoogleSignWeb.getQueryParameters();

  ///make sure add this line
  setPathUrlStrategy();

  ///make sure add this line
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Copro Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
