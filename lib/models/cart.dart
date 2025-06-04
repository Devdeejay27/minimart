import 'package:flutter/material.dart';
import 'package:minimart/models/product.dart';

// manages cart state
class Cart with ChangeNotifier {
  final Map<String, Map<String, dynamic>> _items = {};

  // getter to retrieve cart items
  Map<String, Map<String, dynamic>> get items => _items;

  int get itemCCount => _items.length;

  // adding items to cart
  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!['quantity'] += 1;
    } else {
      _items[product.id] = {
        'product': product,
        'quantity': 1,
      };
    }
    notifyListeners();
  }

  // removing from cart
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void increaseQuantity(String productId) {
    _items[productId]!['quantity'] += 1;
    notifyListeners();
  }

  void decreaseQuantity(String productId) {
    if (_items[productId]!['quantity'] > 1) {
      _items[productId]!['quantity'] -= 1;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value['product'].price * value['quantity'];
    });
    return total;
  }
}
