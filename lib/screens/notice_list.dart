import 'package:copro_admin_web/services/notice_services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoticeListScreen extends StatelessWidget {
  const NoticeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NoticeServices().getNoticeList(),
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
          var noticeList = snapshot.data!.data!.boards;
          return ListView.builder(
            itemCount: noticeList!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  title: Text(noticeList[index].title!),
                  subtitle: Text(noticeList[index].nickName!),
                  onTap: () {
                    context.push('/detail_notice/${noticeList[index].id}');
                  });
            },
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
