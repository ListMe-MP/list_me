class User {
  String username;
  String email;
  String password;
  String? profilePicture;


  User({
    required this.username,
    required this.email,
     this.profilePicture,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        email: json["email"],
        password: json["password"],
        profilePicture: json["profilePicture"],
        
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "profilePicture": profilePicture,
      };
}