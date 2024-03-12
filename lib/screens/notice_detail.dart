import 'package:copro_admin_web/screens/notice_edit.dart';
import 'package:copro_admin_web/services/notice_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

class DetailNoticeScreen extends StatefulWidget {
  const DetailNoticeScreen({super.key, required this.id});
  final int? id;

  @override
  State<DetailNoticeScreen> createState() => _DetailNoticeScreenState();
}

class _DetailNoticeScreenState extends State<DetailNoticeScreen> {
  var noticeTitle;
  var noticeContext;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NoticeServices().detailNotice(widget.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (snapshot.hasData) {
          var notice = snapshot.data!.data;

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(notice!.title!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(notice.nickName!),
                  const Divider(),
                  MarkdownBody(data: notice.contents!),
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    //Notice Data를 가지고 Edit 페이지로 이동
                    context.go('/edit_notice', extra: notice);
                  },
                  child: const Icon(Icons.edit),
                ),
                const SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    _showAlertDialog(context, notice.boardId!);
                  },
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('No Data'),
          );
        }
      },
    );
  }
}

void _showAlertDialog(BuildContext context, int id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('공지사항 삭제'),
        content: const Text('삭제 누르면 돌아갈 수 없어요.'),
        actions: [
          TextButton(
            onPressed: () async {
              await NoticeServices().deleteNotice(id);
              // Close the dialog when the button is pressed
              context.go("/home");
            },
            child: const Text('삭제'),
          ),
        ],
      );
    },
  );
}
