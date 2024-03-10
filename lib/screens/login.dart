import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        '103359214072-ch18gni5f09onpqm86nqfhdo2hc692kt.apps.googleusercontent.com',
  );
  @override
  void initState() {
    super.initState();
    signInWithGoogle();
  }

  Future<void> signInWithGoogle() async {
    try {
      debugPrint("구글 로그인 버튼 눌림");
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signInSilently(); // Change this line
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        debugPrint("ID Token: ${googleSignInAuthentication.idToken}");
      } else {
        debugPrint("No existing user found. Please sign in.");
      }
    } catch (error) {
      debugPrint("Error signing in: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.teal,
          disabledForegroundColor: Colors.grey.withOpacity(0.38),
          disabledBackgroundColor: Colors.grey.withOpacity(0.12),
        ),
        onPressed: () {
          // signInWithGoogle();
        },
        child: const Text(""),
      ),
    ));
  }
}
