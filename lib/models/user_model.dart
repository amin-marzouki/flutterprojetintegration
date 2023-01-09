class UserModel {
  int id;
  String name;
  String email;

  String role;

  int mobile;

  String token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.mobile,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['user_id']);
    name = json['name'];
    email = json['email'];

    mobile = int.parse(json['mobile']);
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': id,
      'name': name,
      'email': email,
      'mobile': mobile,
      'token': token,
    };
  }
}
