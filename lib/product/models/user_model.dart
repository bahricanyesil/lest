import 'package:flutter/material.dart';

@immutable
class User {
  const User({
    this.email,
    this.name,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String?,
      name: json['name'] as String?,
      password: json['password'] as String?,
    );
  }

  final String? email;
  final String? name;
  final String? password;

  User copyWith({
    String? email,
    String? name,
    String? password,
  }) {
    return User(
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }

  @override
  String toString() => 'User(email: $email,name: $name,password: $password)';

  @override
  int get hashCode => Object.hash(email, name, password);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          email == other.email &&
          name == other.name &&
          password == other.password;

  static List<User> get dummyList {
    return <User>[
      const User(
        email: 'bahricanyesil@gmail.com',
        name: 'Bahrican',
        password: 'Bahri0011',
      ),
      const User(
        email: 'enes@gmail.com',
        name: 'Enes',
        password: 'Enes1818',
      ),
    ];
  }
}
