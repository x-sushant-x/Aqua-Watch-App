class LoginUserResponse {
  LoginUserResponse({
    required this.message,
    required this.user,
  });
  late final String message;
  late final User user;
  
  LoginUserResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.location,
     this.favoritePlace,
    required this.language,
    required this.profilePicture,
    required this.phoneNumber,
  });
  late final String id;
  late final String name;
  late final String email;
  late final String location;
  late final Null favoritePlace;
  late final String language;
  late final String profilePicture;
  late final String phoneNumber;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    location = json['location'];
    favoritePlace = null;
    language = json['language'];
    profilePicture = json['profilePicture'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['location'] = location;
    _data['favoritePlace'] = favoritePlace;
    _data['language'] = language;
    _data['profilePicture'] = profilePicture;
    _data['phoneNumber'] = phoneNumber;
    return _data;
  }
}