class UserModel {
  String? uid;
  String? email;

  UserModel({this.uid, this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
      };
}
