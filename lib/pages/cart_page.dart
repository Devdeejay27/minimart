import 'package:flutter/material.dart';
import 'package:minimart/models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart-page';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItems = cart.items;

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: const Color(0xFFFBFBFB),
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Full Logo Box
                    Container(
                      width: 56,
                      height: 28,
                      decoration: BoxDecoration(
                        color: const Color(0xFF93C5FD),
                        borderRadius: BorderRadius.circular(0.88),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                          top: 7.0,
                          left: 2.0,
                        ),
                        child: Text(
                          'Full Logo',
                          style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2563EB),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Delivery Address
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'DELIVERY ADDRESS',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF334155),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Umuezike Road, Oyo State',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF334155),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Notification Icon
                    IconButton(
                      padding:
                          const EdgeInsets.only(top: 2, left: 2.5, bottom: 30),
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none),
                    ),
                  ],
                ),
              ),
            ),
            toolbarHeight: 84,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Cart Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: .0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: Navigator.of(context).pop,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Your Cart',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                ),
                // Cart Items
                cartItems.isEmpty
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Text(
                            'Your cart is empty',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final productId = cartItems.keys.toList()[index];
                          final cartItem = cartItems[productId]!;
                          final product = cartItem['product'];
                          final quantity = cartItem['quantity'];

                          return Card(
                            shadowColor: const Color(0xFFF6F5F8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  // Product Image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5.65),
                                    child: Image.asset(
                                      product.imagePath,
                                      width: 102.87,
                                      height: 106.15,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Product details & controls
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: const TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF334155),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '\$${product.price.toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17,
                                            color: Color(0xFF334155),
                                          ),
                                        ),
                                        const Text(
                                          'In stock',
                                          style: TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            color: Color(0xFF10B981),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            IconButton(
                                              padding: const EdgeInsets.all(8),
                                              onPressed: () {
                                                cart.decreaseQuantity(
                                                    product.id);
                                              },
                                              icon: const Icon(
                                                Icons.remove_circle,
                                                size: 32,
                                                color: Color(0xFFE2E8F0),
                                              ),
                                            ),
                                            Text(
                                              quantity.toString(),
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'SF Pro Text',
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                cart.increaseQuantity(
                                                    product.id);
                                              },
                                              icon: const Icon(
                                                size: 32,
                                                color: Colors.white,
                                                Icons.add_circle,
                                              ),
                                            ),
                                            const SizedBox(width: 30),
                                            // Delete icon
                                            IconButton(
                                              onPressed: () {
                                                cart.removeFromCart(product.id);
                                              },
                                              icon: const Icon(
                                                Icons.delete_outline_rounded,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                const SizedBox(height: 10),
                // Bottom Bar Info
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, -1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Order Info',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Subtotal: ${cart.totalCartItems - 10}',
                        style: const TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        'Shipping: \$10',
                        style: TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Total: ${cart.totalCartItems}',
                        style: const TextStyle(
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Checkout coming soon')),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: Text('Checkout : ${cart.totalCartItems}'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
