import 'package:flutter/material.dart';
import 'item.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  int get totalPrice {
    int total = 0;
    for (var item in _items) {
      total += item.price;
    }
    return total;
  }

  int get count => _items.length;

  bool isAdded(Item item) {
    return _items.any((element) => element.id == item.id);
  }

  void add(Item item) {
    if (!isAdded(item)) {
      _items.add(item);
      notifyListeners();
    }
  }

  void remove(Item item) {
    _items.removeWhere((element) => element.id == item.id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}