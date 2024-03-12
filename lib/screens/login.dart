import 'package:copro_admin_web/services/login_services.dart';
import 'package:copro_admin_web/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
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
  static String signKey = Env().clientId;
  // static final String signKey =
  //     dotenv.env['GOOGLE_SIGNIN_KEY'] ?? 'default_value_if_not_present';
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: '$signKey',
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
      var signedIn = await googleSignIn.isSignedIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        bool signedIn = await LoginServices()
            .getAccessToken(googleSignInAuthentication.idToken);
        if (signedIn) {
          // 성공적으로 작업이 완료되었으므로 네비게이션을 구현합니다.
          context.go('/home');
          debugPrint("로그인 성공");
        } else {
          // 작업이 실패했을 때의 처리를 합니다.
          debugPrint("로그인 실패");
        }
      } else {
        debugPrint("No existing user found. Please sign in.${signedIn}");
      }
    } catch (error) {
      debugPrint("Error signing in: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[600],
        body: const SafeArea(
            child: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Copro Admin Web",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "로그인에 실패하면 링크 재접속을 해주세요.",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        )));
  }
}
