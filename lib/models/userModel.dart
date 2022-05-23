class UserModel {

  late final Data data;
  late final String message;
  late final String status;

  UserModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    message = json['message'];
    status = json['status'];
  }


}

class Data {

  late final String email;
  late final String firstName;
  late final String lastName;
  late final String appUserRole;
  late final bool locked;
  late final bool enabled;
  late final String username;
  late final List<Authorities> authorities;
  late final bool accountNonExpired;
  late final bool accountNonLocked;
  late final bool credentialsNonExpired;

  Data.fromJson(Map<String, dynamic> json){
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    appUserRole = json['appUserRole'];
    locked = json['locked'];
    enabled = json['enabled'];
    username = json['username'];
    authorities = List.from(json['authorities']).map((e)=>Authorities.fromJson(e)).toList();
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
  }


}

class Authorities {

  late final String authority;

  Authorities.fromJson(Map<String, dynamic> json){
    authority = json['authority'];
  }


}