import 'package:copro_admin_web/models/notice_detail_model.dart';
import 'package:copro_admin_web/services/notice_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

class NoticeEditScreen extends StatefulWidget {
  const NoticeEditScreen({super.key, required this.notice});
  final Data notice;
  @override
  State<NoticeEditScreen> createState() => _NoticeEditScreenState();
}

class _NoticeEditScreenState extends State<NoticeEditScreen> {
  late final TextEditingController _editTitleController =
      TextEditingController(text: widget.notice.title!);
  late final TextEditingController _editContentController =
      TextEditingController(text: widget.notice.contents!);
  @override
  void initState() {
    super.initState();
    _editContentController.addListener(_updateMarkdown);
  }

  void _updateMarkdown() {
    setState(() {});
  }

  @override
  void dispose() {
    _editTitleController.dispose();
    _editContentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('공지사항 수정',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            Wrap(
              children: [
                TextFormField(
                  controller: _editTitleController,
                  // initialValue: widget.notice.title!,
                  decoration: const InputDecoration(
                    labelText: '이전 제목',
                    hintText: '제목을 입력하세요',
                    // Add other InputDecoration properties as needed
                  ),
                ),
                TextFormField(
                  controller: _editContentController,
                  maxLines:
                      null, // Set to null for an unlimited number of lines
                  keyboardType: TextInputType.multiline,
                  // initialValue: widget.notice.contents!,
                  decoration: const InputDecoration(
                    labelText: '이전 내용',
                    hintText: '내용을 입력하세요',
                    // Add other InputDecoration properties as needed
                  ),
                  // Add other TextFormField properties as needed
                ),
                const SizedBox(height: 40),
              ],
            ),
            Wrap(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  alignment: Alignment.center,
                  child: const Text("작성글 미리보기",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const Divider(),
                MarkdownBody(
                  data: _editContentController.text,
                ),
                const SizedBox(height: 50),
              ],
            )
          ]),
        )),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await NoticeServices().updateNotice(widget.notice.boardId!,
                _editTitleController.text, _editContentController.text);
            context.go("/home");
          },
          label: const Text("수정하기",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ));
  }
}
