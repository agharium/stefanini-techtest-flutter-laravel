import 'package:flutter_app/helpers/listable.dart';

class UserModel implements Listable {
  int? id;
  String? name;
  String? email;
  String? phone;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    phone: json['phone']
  );
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone
    };
  }
  
  @override
  String get title => name ?? '';
  
  @override
  String get subtitle => email ?? '';
}