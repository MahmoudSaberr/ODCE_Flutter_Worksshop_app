class NewsModel {
  String? code;
  String? message;
  List<Data>? data = [];

  NewsModel();

  NewsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? date;
  String? body;
  String? imageUrl;
  String? linkUrl;
  String? title;

  Data(
      {this.id, this.date, this.body, this.imageUrl, this.linkUrl, this.title});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    body = json['body'];
    imageUrl = json['imageUrl'];
    linkUrl = json['linkUrl'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['body'] = this.body;
    data['imageUrl'] = this.imageUrl;
    data['linkUrl'] = this.linkUrl;
    data['title'] = this.title;
    return data;
  }
}