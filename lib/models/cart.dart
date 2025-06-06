import 'package:flutter/material.dart';
import 'package:minimart/models/product.dart';

//provider class
// manages cart state
class Cart with ChangeNotifier {
  // Stores product ID and a map containing product and quantity
  final Map<String, Map<String, dynamic>> _items = {};

  // getter to retrieve cart items
  Map<String, Map<String, dynamic>> get items => _items;

  int get itemCount => _items.length;

  // adding items to cart (only once)
  void addToCart(Product product) {
    if (!_items.containsKey(product.id)) {
      _items[product.id] = {
        'product': product,
        'quantity': 1,
      };
      notifyListeners();
    }
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

  // total amount (sum of price * quantity)
  double get totalCartItems {
    double total = 0.0;
    _items.forEach((_, value) {
      final product = value['product'] as Product;
      final quantity = value['quantity'] as int;
      total += product.price * quantity;
    });
    return total;
  }

  // clear entire cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
