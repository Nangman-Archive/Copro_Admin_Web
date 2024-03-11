import 'package:copro_admin_web/screens/notice_list.dart';
import 'package:copro_admin_web/services/notice_services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditNoticeScreen extends StatelessWidget {
  const EditNoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(child: NoticeListScreen());
  }
}
