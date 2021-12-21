class AccessData {
  final String? token;
  final User? user;

  AccessData({
    this.token,
    this.user,
  });

  AccessData.fromJson(Map<String, dynamic> json)
      : token = json['token'] as String?,
        user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'token' : token,
    'user' : user?.toJson()
  };
}

class User {
  final int? pk;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;

  User({
    this.pk,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
  });

  User.fromJson(Map<String, dynamic> json)
      : pk = json['pk'] as int?,
        username = json['username'] as String?,
        email = json['email'] as String?,
        firstName = json['first_name'] as String?,
        lastName = json['last_name'] as String?;

  Map<String, dynamic> toJson() => {
    'pk' : pk,
    'username' : username,
    'email' : email,
    'first_name' : firstName,
    'last_name' : lastName
  };
}