import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../models/item.dart';
import '../widgets/catalog_item.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  final List<Item> foods = const [];

  List<Item> getFoodList() {
    return [
      Item(id: 1, name: 'Pizza', category: 'Italian Food', price: 100, image: '🍕'),
      Item(id: 2, name: 'Noodles', category: 'Chinese Food', price: 80, image: '🍜'),
      Item(id: 3, name: 'Ice Cream', category: 'Dessert', price: 50, image: '🍨'),
      Item(id: 4, name: 'Biryani', category: 'Indian Food', price: 120, image: '🍛'),
      Item(id: 5, name: 'Banana', category: 'Fruit', price: 20, image: '🍌'),
      Item(id: 6, name: 'Drink', category: 'Beverage', price: 30, image: '🍹'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final foodList = getFoodList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Catalog'),
        centerTitle: true,
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    icon: const Icon(Icons.shopping_cart),
                  ),
                  if (cart.count > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor: Colors.red,
                        child: Text(
                          cart.count.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          return CatalogItem(item: foodList[index]);
        },
      ),
    );
  }
}