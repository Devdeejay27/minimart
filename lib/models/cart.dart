import 'package:flutter/material.dart';
import 'package:minimart/models/product.dart';

// manages cart state
class Cart with ChangeNotifier {
  // Stores product ID and a map containing product and quantity
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
  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  // Inc. quantity
  void increaseQuantity(String productId) {
    if (_items.containsKey(productId)) {
      _items[productId]!['quantity'] += 1;
      notifyListeners();
    }
  }

  // Dec. quantity
  void decreaseQuantity(String productId) {
    if (_items.containsKey(productId)) {
      if (_items[productId]!['quantity'] > 1) {
        _items[productId]!['quantity'] -= 1;
      } else {
        _items.remove(productId); // remove if quantity goes to zero
      }
      notifyListeners();
    }
  }

  // total, counting quantity, not just different products
  int get totalCartItems {
    int total = 0;
    _items.forEach((_, value) {
      total += value['quantity'] as int;
    });
    return total;
  }

  // clear entire cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
