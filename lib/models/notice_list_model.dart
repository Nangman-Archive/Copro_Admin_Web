class NoticeListModel {
  int? statusCode;
  String? message;
  Data? data;

  NoticeListModel({this.statusCode, this.message, this.data});

  NoticeListModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Boards>? boards;
  PageInfo? pageInfo;

  Data({this.boards, this.pageInfo});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['boards'] != null) {
      boards = <Boards>[];
      json['boards'].forEach((v) {
        boards!.add(Boards.fromJson(v));
      });
    }
    pageInfo =
        json['pageInfo'] != null ? PageInfo.fromJson(json['pageInfo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (boards != null) {
      data['boards'] = boards!.map((v) => v.toJson()).toList();
    }
    if (pageInfo != null) {
      data['pageInfo'] = pageInfo!.toJson();
    }
    return data;
  }
}

class Boards {
  int? id;
  String? title;
  String? nickName;
  String? createAt;
  int? count;
  int? heart;
  String? imageUrl;
  int? commentCount;

  Boards(
      {this.id,
      this.title,
      this.nickName,
      this.createAt,
      this.count,
      this.heart,
      this.imageUrl,
      this.commentCount});

  Boards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    nickName = json['nickName'];
    createAt = json['createAt'];
    count = json['count'];
    heart = json['heart'];
    imageUrl = json['imageUrl'];
    commentCount = json['commentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['nickName'] = nickName;
    data['createAt'] = createAt;
    data['count'] = count;
    data['heart'] = heart;
    data['imageUrl'] = imageUrl;
    data['commentCount'] = commentCount;
    return data;
  }
}

class PageInfo {
  int? currentPage;
  int? size;
  bool? hasNext;
  bool? hasPrevious;
  int? numberOfElements;
  int? totalElements;
  int? totalPages;
  bool? first;
  bool? last;

  PageInfo(
      {this.currentPage,
      this.size,
      this.hasNext,
      this.hasPrevious,
      this.numberOfElements,
      this.totalElements,
      this.totalPages,
      this.first,
      this.last});

  PageInfo.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    size = json['size'];
    hasNext = json['hasNext'];
    hasPrevious = json['hasPrevious'];
    numberOfElements = json['numberOfElements'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['size'] = size;
    data['hasNext'] = hasNext;
    data['hasPrevious'] = hasPrevious;
    data['numberOfElements'] = numberOfElements;
    data['totalElements'] = totalElements;
    data['totalPages'] = totalPages;
    data['first'] = first;
    data['last'] = last;
    return data;
  }
}
