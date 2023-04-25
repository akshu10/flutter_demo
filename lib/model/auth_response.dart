class AuthResponse {
  String? token;
  User? user;

  AuthResponse({this.token, this.user});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    // ignore: avoid_print

    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  int? organizationId;
  String? organizationUuid;
  String? organizationName;
  List<String>? organizations;
  String? email;
  String? username;
  String? name;
  List<String>? roles;
  bool? firebaseEnabled;

  User(
      {this.id,
      this.organizationId,
      this.organizationUuid,
      this.organizationName,
      this.organizations,
      this.email,
      this.username,
      this.name,
      this.roles,
      this.firebaseEnabled});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organizationId = json['organizationId'];
    organizationUuid = json['organizationUuid'];
    organizationName = json['organizationName'];
    organizations = json['organizations'].cast<String>();
    email = json['email'];
    username = json['username'];
    name = json['name'];
    roles = json['roles'].cast<String>();
    firebaseEnabled = json['firebaseEnabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['organizationId'] = organizationId;
    data['organizationUuid'] = organizationUuid;
    data['organizationName'] = organizationName;
    data['organizations'] = organizations;
    data['email'] = email;
    data['username'] = username;
    data['name'] = name;
    data['roles'] = roles;
    data['firebaseEnabled'] = firebaseEnabled;
    return data;
  }
}
