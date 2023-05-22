import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lest/core/extensions/string_extensions.dart';
import 'package:lest/core/helpers/string_helpers.dart';
import 'package:lest/features/home/models/category_model.dart';

@immutable
class Product {
  const Product({
    this.price,
    this.lat,
    this.lon,
    this.rating,
    this.imageUrl,
    this.name,
    this.description,
    this.category,
    this.producer,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      price: json['price'] as double?,
      lat: json['lat'] as double?,
      lon: json['lon'] as double?,
      rating: json['rating'] as double?,
      imageUrl: json['image_url'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      producer: json['producer'] as String?,
    );
  }

  factory Product.dummy({
    String? name,
    String? description,
    String? imageUrl,
    String? categoryName,
    String? producer,
  }) {
    return Product(
      price: Random().nextInt(30) + Random().nextDouble(),
      lat: Random().nextInt(100) + Random().nextDouble(),
      lon: Random().nextInt(100) + Random().nextDouble(),
      rating: Random().nextInt(5) + 1,
      imageUrl: imageUrl ?? StringHelpers.generateRandom(),
      name: name ?? StringHelpers.generateRandom(),
      description: description ?? StringHelpers.generateRandom(),
      category: Category(
        icon: StringHelpers.generateRandom(),
        name: categoryName ?? StringHelpers.generateRandom(),
      ),
      producer: producer ?? StringHelpers.generateRandom(),
    );
  }

  final double? price;
  final double? lat;
  final double? lon;
  final double? rating;
  final String? imageUrl;
  final String? name;
  final String? description;
  final Category? category;
  final String? producer;

  Product copyWith({
    double? price,
    double? lat,
    double? lon,
    double? rating,
    String? imageUrl,
    String? name,
    String? description,
    Category? category,
    String? producer,
  }) {
    return Product(
      price: price ?? this.price,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      rating: rating ?? this.rating,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      producer: producer ?? this.producer,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'price': price,
      'lat': lat,
      'lon': lon,
      'rating': rating,
      'image_url': imageUrl,
      'name': name,
      'description': description,
      'category': category?.toJson(),
      'producer': producer,
    };
  }

  @override
  String toString() =>
      '''Product(price: $price,lat: $lat,lon: $lon,rating: $rating,imageUrl: $imageUrl,name: $name,description: $description, category: $category, producer: $producer)''';

  @override
  int get hashCode => Object.hash(
        price,
        lat,
        lon,
        rating,
        imageUrl,
        name,
        description,
        category,
        producer,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          price == other.price &&
          lat == other.lat &&
          lon == other.lon &&
          rating == other.rating &&
          imageUrl == other.imageUrl &&
          name == other.name &&
          category == other.category &&
          producer == other.producer &&
          description == other.description;
}

extension ProductListX on List<Product> {
  List<Product> filteredProducts(String? query) =>
      where((product) => product.name?.uncaseContains(query) ?? false).toList();

  List<Product> startsWithProducts(String? query) =>
      where((product) => product.name?.uncaseStartsWith(query) ?? false)
          .toList();
}
