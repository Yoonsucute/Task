import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../models/item.dart';

class CatalogItem extends StatelessWidget {
  final Item item;

  const CatalogItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        final added = cart.isAdded(item);

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 3,
          child: ListTile(
            leading: Text(
              item.image,
              style: const TextStyle(fontSize: 36),
            ),
            title: Text(
              item.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('${item.category}\nPrice: ${item.price}.000 VNĐ'),
            isThreeLine: true,
            trailing: added
                ? const Text(
                    'Added',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      Provider.of<CartModel>(
                        context,
                        listen: false,
                      ).add(item);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${item.name} added to cart'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Text('Add'),
                  ),
          ),
        );
      },
    );
  }
}