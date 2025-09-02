class UserModel {
  late int id;
  late String userName;
  late String? email;
  late String phone;
  String? token;
  String? lat;
  String? lng;

  UserModel({
    required this.userName,
    required this.email,
    required this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['name'];
    email = json['email'];
    phone = json['phone'];
    token = json['token'];
    lat = json['lat'];
    lng = json['lng'];
  }

  @override
  String toString() {
    return 'User(id: $id, name: $userName, token: $token, email: $email, phone: $phone, lat: $lat, lng: $lng)';
  }
}
