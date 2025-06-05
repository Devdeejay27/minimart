import 'package:flutter/material.dart';
import 'package:minimart/pages/cart_page.dart';
import 'package:provider/provider.dart';
import 'package:minimart/models/product.dart';
import 'package:minimart/models/cart.dart';

class ProductDetails extends StatelessWidget {
  static const routeName = '/product-details';
  const ProductDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                const SliverAppBar(
                  backgroundColor: Color(0xFFFBFBFB),
                  pinned: true,
                  floating: false,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  expandedHeight: 120,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'DELIVERY ADDRESS',
                            style: TextStyle(
                              fontFamily: 'IBMPlexSans',
                              fontSize: 10,
                              color: Color(0xFF334155),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Umuezike Road, Oyo State',
                            style: TextStyle(
                              fontFamily: 'IBMPlexSans',
                              fontSize: 12,
                              color: Color(0xFF334155),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 6.5,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Go back',
                            style: TextStyle(
                              fontFamily: 'IBMPlexSans',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            color: Colors.white,
                            child: Image.asset(
                              product.imagePath,
                              height: 331.6,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Color(0xFF000000),
                              ),
                              onPressed: () {
                                // Add your favorite logic here
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontFamily: 'IBMPlexSans',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                            fontFamily: 'IBMPlexSans',
                            fontSize: 32.75,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          product.description,
                          style: const TextStyle(
                            fontFamily: 'IBMPlexSans',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(
                                top: 8,
                                right: 16,
                                bottom: 8,
                                left: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: const Color(
                                  0xFF60B5FF), // Customize as needed
                            ),
                            onPressed: () {
                              cart.addToCart(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  elevation: 0,
                                  showCloseIcon: true,
                                  closeIconColor: const Color(0xFF334155),
                                  backgroundColor: const Color(0xFFFFFFFF),
                                  padding: const EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                      width: 2,
                                      color: Color(0xFF10B981),
                                    ),
                                  ),
                                  content: const Text(
                                    'Item has been added to cart',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF334155),
                                    ),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  margin: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    bottom: 530,
                                  ),
                                ),
                              );
                              Navigator.pushNamed(
                                context,
                                CartPage.routeName,
                                arguments: cart,
                              );
                            },
                            child: const Text(
                              'Add to cart',
                              style: TextStyle(
                                fontFamily: 'IBMPlexSans',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Notification icon at top right
            Positioned(
              top: 16,
              right: 16,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon:
                      const Icon(Icons.notifications_none, color: Colors.black),
                  onPressed: () {
                    // Notification logic
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
