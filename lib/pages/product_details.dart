import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minimart/models/product.dart';
import 'package:minimart/models/cart.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBFBFB),
        title: const Column(
          children: [
            Text(
              'DELIVERY ADDRESS',
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFF334155),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Umuezike Road, Oyo State',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF334155),
              ),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
          ),
        ],
        centerTitle: true,
      ),
    );
  }
}
