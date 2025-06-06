import 'package:flutter/material.dart';
import 'package:minimart/models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  //route to cart page
  static const routeName = '/cart-page';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItems = cart.items;

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // custom appBar section
              Padding(
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
                          left: 4.38,
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
              // Divider after address
              const Divider(
                thickness: 1,
                color: Color(0xFFE5E7EB),
                height: 0,
              ),
              // your cart
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      // back button pressed
                      onTap: () => Navigator.of(context).pop(),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 10,
                          color: Color(0xFF64748B),
                        ),
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
              // items inside cart
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
                  //builds list of cart items
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final productId = cartItems.keys.toList()[index];
                        final cartItem = cartItems[productId]!;
                        final product = cartItem['product'];
                        final quantity = cartItem['quantity'];

                        return Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF6F5F8),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                // product image
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
                                // product details & controls
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
                                          // minus button
                                          GestureDetector(
                                            //when pressed
                                            onTap: () {
                                              cart.decreaseQuantity(product.id);
                                            },
                                            child: Container(
                                              width: 32,
                                              height: 32,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFE2E8F0),
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xFFE2E8F0),
                                                    blurRadius: 2,
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                Icons.remove,
                                                color: Color(0xFF64748B),
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Text(
                                            // quantity of the particular item
                                            quantity.toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'SF Pro Text',
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(width: 20),
                                          // plus button
                                          GestureDetector(
                                            // when pressed
                                            onTap: () {
                                              cart.increaseQuantity(product.id);
                                            },
                                            child: Container(
                                              width: 32,
                                              height: 32,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x11000000),
                                                    blurRadius: 2,
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Color(0xFF334155),
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 50),
                                          // Delete icon
                                          GestureDetector(
                                            // when delete is pressed
                                            onTap: () {
                                              cart.removeFromCart(product.id);
                                            },
                                            child: Container(
                                              width: 32,
                                              height: 32,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Icon(
                                                Icons.delete_outline_rounded,
                                                color: Color(0xFF999999),
                                                size: 19.64,
                                              ),
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
              // order info section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Order Info',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'IBM Plex Sans',
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Subtotal',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          // when cart is empty, show zero, if not show value
                          '\$${cartItems.isEmpty ? 0 : cart.totalCartItems}',
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Shipping',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          // when cart is empty, show zero, if not show value
                          '\$${cartItems.isEmpty ? 0 : 10}',
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          // when cart is empty, show zero, if not show value
                          '\$${cartItems.isEmpty ? 0 : (cart.totalCartItems + 10)}',
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              //checkout button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    //cart empty, button doesn't show
                    onPressed: cartItems.isEmpty
                        ? null
                        : () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Checkout coming soon')),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF60B5FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Checkout (\$${cartItems.isEmpty ? 0 : (cart.totalCartItems + 10)})',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'IBM Plex Sans',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
