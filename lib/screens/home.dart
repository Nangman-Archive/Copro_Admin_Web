import 'package:copro_admin_web/screens/edit_notice_board.dart';
import 'package:copro_admin_web/screens/member_list.dart';
import 'package:copro_admin_web/screens/notice_add.dart';
import 'package:copro_admin_web/screens/report_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const NoticeAddScreen(),
    EditNoticeScreen(),
    const MemberListScreen(),
    const ReportListScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Copro Admin'),
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.note_add),
                selectedIcon: Icon(Icons.note_add_outlined),
                label: Text('Add Notice'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.note_alt_rounded),
                selectedIcon: Icon(Icons.note_alt_outlined),
                label: Text('Edit Notice'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people_alt),
                selectedIcon: Icon(Icons.people_alt_outlined),
                label: Text('All Users'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.report),
                selectedIcon: Icon(Icons.report_gmailerrorred_outlined),
                label: Text('Report'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }
}
