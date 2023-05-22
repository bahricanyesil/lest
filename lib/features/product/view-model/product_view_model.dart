import 'package:flutter/material.dart';
import 'package:lest/features/home/models/product_model.dart';

class ProductViewModel extends ChangeNotifier {
  Product? _selectedProduct;
  Product? get selectedProduct => _selectedProduct;

  void selectProduct(Product? newProduct, {bool notify = true}) {
    if (_selectedProduct == newProduct) return;
    _selectedProduct = newProduct;
    if (notify) notifyListeners();
  }
}
