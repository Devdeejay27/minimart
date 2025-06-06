import 'package:flutter/material.dart';
import 'package:minimart/models/cart.dart';
import 'package:minimart/pages/cart_page.dart';
import 'package:minimart/pages/home_page.dart';
import 'package:minimart/pages/product_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      // to alert the cart provider
      create: (context) => Cart(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimart',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        // product clicked on home page, takes to details
        ProductDetails.routeName: (context) => const ProductDetails(),
        // cart icon clicked, takes to cart page
        CartPage.routeName: (context) => const CartPage(),
      },
    );
  }
}
