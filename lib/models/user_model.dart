class Users {
  String? id;
  int? page;
  int? perPage;
  int? totalrecord;
  int? totalPages;
  List<Data>? data;

  Users(
      {this.id,
      this.page,
      this.perPage,
      this.totalrecord,
      this.totalPages,
      this.data});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    page = json['page'];
    perPage = json['per_page'];
    totalrecord = json['totalrecord'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['totalrecord'] = this.totalrecord;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? email;
  String? profilepicture;
  String? location;
  String? createdat;

  Data(
      {required this.id,
      this.name,
      this.email,
      this.profilepicture,
      this.location,
      this.createdat});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['$id'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilepicture = json['profilepicture'];
    location = json['location'];
    createdat = json['createdat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$id'] = this.id;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profilepicture'] = this.profilepicture;
    data['location'] = this.location;
    data['createdat'] = this.createdat;
    return data;
  }
}
