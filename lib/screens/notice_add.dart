import 'package:copro_admin_web/services/notice_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';

class NoticeAddScreen extends StatefulWidget {
  const NoticeAddScreen({super.key});

  @override
  State<NoticeAddScreen> createState() => _NoticeAddScreenState();
}

class _NoticeAddScreenState extends State<NoticeAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _imageFileController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _contentController.addListener(_updateMarkdown);
  }

  void _updateMarkdown() {
    setState(() {});
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _imageFileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('공지사항 작성',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: '제목',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '제목을 입력해주세요.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _contentController,
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: '내용',
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '내용을 입력해주세요.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              Container(
                width: MediaQuery.sizeOf(context).width,
                alignment: Alignment.center,
                child: const Text("작성글 미리보기",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_titleController.text),
                  const Divider(),
                  MarkdownBody(
                    data: _contentController.text,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await NoticeServices().addNotice(
                _titleController.text,
                _contentController.text,
              );
              _showAlertDialogAddNotice(context);
            }
          },
          label: const Text("공지사항 등록")),
    );
  }
}

void _showAlertDialogAddNotice(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('공지사항 추가완료 했어요.'),
        actions: [
          TextButton(
            onPressed: () async {
              // Close the dialog when the button is pressed
              context.pop();
            },
            child: const Text('확인'),
          ),
        ],
      );
    },
  );
}
