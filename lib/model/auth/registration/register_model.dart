class SignUpModel {
  String? code;
  String? message;
  Data? data;

  SignUpModel({this.code, this.message, this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? email;
  String? password;
  String? name;
  String? gender;
  String? phoneNumber;
  int? universityId;
  int? gradeId;
  int? roleId;

  Data(
      {this.email,
        this.password,
        this.name,
        this.gender,
        this.phoneNumber,
        this.universityId,
        this.gradeId,
        this.roleId,});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    universityId = json['universityId'];
    gradeId = json['gradeId'];
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['phoneNumber'] = this.phoneNumber;
    data['universityId'] = this.universityId;
    data['gradeId'] = this.gradeId;
    data['roleId'] = this.roleId;
    return data;
  }
}

class UniversityModel {
  String? code;
  String? message;
  List<UniversityData> listUniversityData = [];
  UniversityModel();
  UniversityModel.fromJson({required Map<String, dynamic> json}) {
    code = json['code'];
    message = json['message'];
    json['data'].forEach((element) {
      UniversityData item = UniversityData.fromJson(json: element);
      listUniversityData.add(item);
    });
  }
}

class UniversityData{
  int? id;
  String? name;
  UniversityData.fromJson({required Map<String, dynamic> json}) {
    id = json['id'];
    name = json['name'];
  }
}

class GradeModel {
  String? code;
  String? message;
  List<GradeData>? data = [];

  GradeModel({this.code, this.message, this.data});

  GradeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GradeData>[];
      json['data'].forEach((v) {
        data!.add(new GradeData.fromJson(v));
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

class GradeData {
  String? grade;

  GradeData({this.grade});

  GradeData.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grade'] = this.grade;
    return data;
  }
}