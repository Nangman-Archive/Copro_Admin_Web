class NoticeDetailModel {
  int? statusCode;
  String? message;
  Data? data;

  NoticeDetailModel({this.statusCode, this.message, this.data});

  NoticeDetailModel.fromJson(Map<String, dynamic> json) {
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
  int? boardId;
  String? title;
  String? createAt;
  String? category;
  String? contents;
  String? part;
  String? tag;
  int? count;
  int? heart;
  List<int>? imageId;
  List<String>? imageUrl;
  String? nickName;
  String? occupation;
  String? email;
  String? picture;
  bool? isHeart;
  bool? isScrap;
  int? commentCount;

  Data(
      {this.boardId,
      this.title,
      this.createAt,
      this.category,
      this.contents,
      this.part,
      this.tag,
      this.count,
      this.heart,
      this.imageId,
      this.imageUrl,
      this.nickName,
      this.occupation,
      this.email,
      this.picture,
      this.isHeart,
      this.isScrap,
      this.commentCount});

  Data.fromJson(Map<String, dynamic> json) {
    boardId = json['boardId'];
    title = json['title'];
    createAt = json['createAt'];
    category = json['category'];
    contents = json['contents'];
    part = json['part'];
    tag = json['tag'];
    count = json['count'];
    heart = json['heart'];
    imageId = json['imageId'].cast<int>();
    imageUrl = json['imageUrl'].cast<String>();
    nickName = json['nickName'];
    occupation = json['occupation'];
    email = json['email'];
    picture = json['picture'];
    isHeart = json['isHeart'];
    isScrap = json['isScrap'];
    commentCount = json['commentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['boardId'] = boardId;
    data['title'] = title;
    data['createAt'] = createAt;
    data['category'] = category;
    data['contents'] = contents;
    data['part'] = part;
    data['tag'] = tag;
    data['count'] = count;
    data['heart'] = heart;
    data['imageId'] = imageId;
    data['imageUrl'] = imageUrl;
    data['nickName'] = nickName;
    data['occupation'] = occupation;
    data['email'] = email;
    data['picture'] = picture;
    data['isHeart'] = isHeart;
    data['isScrap'] = isScrap;
    data['commentCount'] = commentCount;
    return data;
  }
}
