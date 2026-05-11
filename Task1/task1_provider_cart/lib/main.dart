import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart_model.dart';
import 'screens/catalog_screen.dart';
import 'screens/cart_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Cart App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CatalogScreen(),
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}