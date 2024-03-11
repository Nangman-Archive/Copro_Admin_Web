import 'dart:developer';

import 'package:copro_admin_web/models/member_list_model.dart';
import 'package:copro_admin_web/services/member_services.dart';
import 'package:flutter/material.dart';

class MemberListScreen extends StatefulWidget {
  const MemberListScreen({super.key});

  @override
  State<MemberListScreen> createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  late ScrollController _scrollController;
  final List<Content> _memberList = [];
  int _currentPage = 0;
  bool _isLoading = false;
  bool _scrollAble = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    _loadData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent &&
        _scrollAble == true) {
      // 스크롤이 끝까지 도달하면 데이터를 추가로 로드

      _loadData();
    }
  }

  Future<void> _loadData() async {
    if (!_isLoading) {
      setState(() {
        _isLoading = true;
      });

      try {
        // 데이터를 가져오는 비동기 함수 호출
        MemberListModel data =
            await MemberServices().getMemberList(_currentPage);

        // 현재 페이지 증가
        if (data.data!.totalPages! > _currentPage) {
          setState(() {
            // 가져온 데이터를 리스트에 추가
            _memberList.addAll(data.data!.content as Iterable<Content>);
            _currentPage++;
          });
        } else {
          _scrollAble = false;
        }

        log("Member List Length : ${_memberList.length}$_currentPage");
      } catch (e) {
        debugPrint('Error loading data: $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      itemCount: _memberList.length + (_scrollAble == true ? 1 : 0),
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        if (index == _memberList.length) {
          // 로딩 중인 경우 아이템 하나 추가
          return _buildLoadingIndicator();
        } else {
          // 실제 데이터 아이템
          return ListTile(
            title: Text(_memberList[index].nickName!),
            subtitle: Text(_memberList[index].email!),
            leading: Image.network(_memberList[index].picture!),
            onTap: () {
              // 탭 이벤트 처리
              // context.push('/detail_notice/$reportId');
            },
          );
        }
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
