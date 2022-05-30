class UserModel {
  UserModel({
    required this.data,
    required this.message,
    required this.token,

  });
  late final Data data;
  late final String message;
   String? token;


  UserModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    message = json['message'];
    token = json['token'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['message'] = message;
    _data['token'] = token;

    return _data;
  }
}

class Data {
  Data({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.fcmToken,
    required this.appUserRole,
    required this.locked,
    required this.enabled,
    required this.accountNonExpired,
    required this.accountNonLocked,
    required this.credentialsNonExpired,
    required this.username,
    required this.authorities,
  });
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String fcmToken;
  late final String appUserRole;
  late final bool locked;
  late final bool enabled;
  late final bool accountNonExpired;
  late final bool accountNonLocked;
  late final bool credentialsNonExpired;
  late final String username;
  late final List<Authorities> authorities;

  Data.fromJson(Map<String, dynamic> json){
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fcmToken = json['fcm_token'];
    appUserRole = json['appUserRole'];
    locked = json['locked'];
    enabled = json['enabled'];
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
    username = json['username'];
    authorities = List.from(json['authorities']).map((e)=>Authorities.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['email'] = email;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['fcm_token'] = fcmToken;
    _data['appUserRole'] = appUserRole;
    _data['locked'] = locked;
    _data['enabled'] = enabled;
    _data['accountNonExpired'] = accountNonExpired;
    _data['accountNonLocked'] = accountNonLocked;
    _data['credentialsNonExpired'] = credentialsNonExpired;
    _data['username'] = username;
    _data['authorities'] = authorities.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Authorities {
  Authorities({
    required this.authority,
  });
  late final String authority;

  Authorities.fromJson(Map<String, dynamic> json){
    authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['authority'] = authority;
    return _data;
  }
}