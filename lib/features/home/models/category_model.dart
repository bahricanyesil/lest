import 'package:flutter/material.dart';

@immutable
class Category {
  const Category({
    this.name,
    this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );
  }

  factory Category.fruit() => const Category(
        name: 'Fruit',
        icon: 'Icons.local_florist',
      );

  factory Category.vegetable() => const Category(
        name: 'Vegetable',
        icon: 'Icons.eco',
      );

  final String? name;
  final String? icon;

  Category copyWith({
    String? name,
    String? icon,
  }) {
    return Category(
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
    };
  }

  @override
  String toString() => 'Category(name: $name,icon: $icon)';

  @override
  int get hashCode => Object.hash(name, icon);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Category &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          icon == other.icon;
}
