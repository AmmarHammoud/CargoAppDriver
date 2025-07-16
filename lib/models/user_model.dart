class UserModel{
  late String userName;
  late String email;

  UserModel({required this.userName, required this.email});

  UserModel.fromJson(Map<String, dynamic> json){
    userName = json['user_name'];
    email = json['email'];
  }
}