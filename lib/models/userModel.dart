class UserModel {
  dynamic id;
  String? f_name;
  String? l_name;
  String? email;
  dynamic password;
  dynamic image ="";
  // "https://firebasestorage.googleapis.com/v0/b/kamha-15aea.appspot.com/o/users%2F-5778350692988206903_121.jpg?alt=media&token=5d955b65-5ba7-4213-9200-949700e571a6"
      

  UserModel(
      {this.id,
      required f_name,
      required l_name,
      required email,
      required password,
      this.image});

  UserModel.fromJson(Map<String, dynamic> json) {
    f_name = json['firstname'];
    l_name = json["lastname"];
    email = json["email"];
    password = json["password"];
    image = json["image"];
  }
  Map<String, dynamic> toMap() {
    return {
      'firstname': f_name,
      'lastname': l_name,
      'email': email,
      'password': password,
      'image': image,
    };
  }
}
