class MemberListModel {
  int? statusCode;
  String? message;
  Data? data;

  MemberListModel({this.statusCode, this.message, this.data});

  MemberListModel.fromJson(Map<String, dynamic> json) {
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
  List<Content>? content;
  Pageable? pageable;
  int? totalPages;
  int? totalElements;
  bool? last;
  int? size;
  int? number;
  Sort? sort;
  int? numberOfElements;
  bool? first;
  bool? empty;

  Data(
      {this.content,
      this.pageable,
      this.totalPages,
      this.totalElements,
      this.last,
      this.size,
      this.number,
      this.sort,
      this.numberOfElements,
      this.first,
      this.empty});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
    pageable =
        json['pageable'] != null ? Pageable.fromJson(json['pageable']) : null;
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    last = json['last'];
    size = json['size'];
    number = json['number'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    numberOfElements = json['numberOfElements'];
    first = json['first'];
    empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    data['totalPages'] = totalPages;
    data['totalElements'] = totalElements;
    data['last'] = last;
    data['size'] = size;
    data['number'] = number;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['numberOfElements'] = numberOfElements;
    data['first'] = first;
    data['empty'] = empty;
    return data;
  }
}

class Content {
  int? memberId;
  String? name;
  String? email;
  String? picture;
  String? occupation;
  String? language;
  int? career;
  String? gitHubUrl;
  String? nickName;
  int? likeMembersCount;
  bool? isLikeMembers;

  Content(
      {this.memberId,
      this.name,
      this.email,
      this.picture,
      this.occupation,
      this.language,
      this.career,
      this.gitHubUrl,
      this.nickName,
      this.likeMembersCount,
      this.isLikeMembers});

  Content.fromJson(Map<String, dynamic> json) {
    memberId = json['memberId'];
    name = json['name'];
    email = json['email'];
    picture = json['picture'];
    occupation = json['occupation'];
    language = json['language'];
    career = json['career'];
    gitHubUrl = json['gitHubUrl'];
    nickName = json['nickName'];
    likeMembersCount = json['likeMembersCount'];
    isLikeMembers = json['isLikeMembers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['memberId'] = memberId;
    data['name'] = name;
    data['email'] = email;
    data['picture'] = picture;
    data['occupation'] = occupation;
    data['language'] = language;
    data['career'] = career;
    data['gitHubUrl'] = gitHubUrl;
    data['nickName'] = nickName;
    data['likeMembersCount'] = likeMembersCount;
    data['isLikeMembers'] = isLikeMembers;
    return data;
  }
}

class Pageable {
  int? pageNumber;
  int? pageSize;
  Sort? sort;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.pageNumber,
      this.pageSize,
      this.sort,
      this.offset,
      this.paged,
      this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['offset'] = offset;
    data['paged'] = paged;
    data['unpaged'] = unpaged;
    return data;
  }
}

class Sort {
  bool? sorted;
  bool? empty;
  bool? unsorted;

  Sort({this.sorted, this.empty, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    sorted = json['sorted'];
    empty = json['empty'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sorted'] = sorted;
    data['empty'] = empty;
    data['unsorted'] = unsorted;
    return data;
  }
}
