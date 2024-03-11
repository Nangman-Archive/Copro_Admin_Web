import 'package:copro_admin_web/services/notice_services.dart';
import 'package:copro_admin_web/services/report_services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReportListScreen extends StatelessWidget {
  const ReportListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ReportServices().getReportList(),
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
          var noticeList = snapshot.data!.data!.content;
          return ListView.builder(
            itemCount: noticeList!.length,
            itemBuilder: (BuildContext context, int index) {
              var reportId = noticeList[index].boardId;
              return ListTile(
                  title: Text(noticeList[index].boardTitle!),
                  subtitle: Text(noticeList[index].contents!),
                  leading: const Icon(
                    Icons.report_gmailerrorred_outlined,
                    color: Colors.red,
                  ),
                  onTap: () {
                    context.push('/detail_notice/$reportId');
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
