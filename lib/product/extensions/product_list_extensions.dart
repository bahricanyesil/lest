import 'dart:developer';

import 'package:lest/core/extensions/string_extensions.dart';
import 'package:lest/features/home/models/product_model.dart';

extension ProductListX on List<Product> {
  List<Product> filterByCateName(String? cateName) {
    if (cateName == null) {
      log('Please provide a category name');
      return [];
    }
    return where((Product p) => (p.category?.name ?? '').uncaseEqual(cateName))
        .toList();
  }
}
