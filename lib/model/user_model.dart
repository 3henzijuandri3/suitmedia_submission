class UserModel{
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? avatar;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.avatar
  });

  factory UserModel.fromJson(Map<String, dynamic> json)
  =>
      UserModel(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        avatar: json['avatar'],
      );

}