import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:minimart/models/product.dart';
import 'package:minimart/models/cart.dart';

class ProductDetails extends StatelessWidget {
  //route
  static const routeName = '/product-details';
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Custom App Bar Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
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
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          //DELIVERY ADDRESS
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
              // Divider after header
              const Divider(
                thickness: 1,
                color: Color(0xFFE5E7EB),
                height: 0,
              ),
              const SizedBox(height: 10),
              // Go back row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GestureDetector(
                  // when back button is tapped, home page
                  onTap: () => Navigator.of(context).pop(),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 10,
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
              // Faint divider after Go back
              Divider(
                thickness: 1,
                color: const Color(0xFFE5E7EB).withOpacity(0.3),
                height: 24,
              ),
              // Product Image & Favorite
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
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
                            //what will happen if it is pressed
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Product Details
              Padding(
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
                        color: Colors.black, //same as #000000 on figma design
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: 'IBMPlexSans',
                        fontSize: 32.75,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'About this item',
                      style: TextStyle(
                        fontFamily: 'IBMPlexSans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF999999),
                      ),
                    ),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontFamily: 'IBMPlexSans',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF999999),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // add to cart button
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
                          backgroundColor: const Color(0xFF60B5FF),
                        ),
                        onPressed: () {
                          Provider.of<Cart>(context, listen: false)
                              .addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                              // snackbar to display notification at top
                              SnackBar(
                            showCloseIcon: true,
                            closeIconColor: const Color(0xFF334155),
                            elevation: 0,
                            backgroundColor: const Color(0xFFFFFFFF),
                            padding: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            content: Row(
                              children: [
                                // green at left side of snack bar border
                                Container(
                                  width: 6,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF10B981),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // green tick inside snackbar
                                const Icon(
                                  Icons.check_circle_outline,
                                  color: Color(0xFF10B981),
                                  size: 14.5,
                                ),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text(
                                    // text displayed in snackbar
                                    'Item has been added to cart',
                                    style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF334155),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // position snackbar appears
                            behavior: SnackBarBehavior.floating,
                            margin: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              top: 16,
                              bottom: 500,
                            ),
                            //delay instructions from figma
                            duration: const Duration(milliseconds: 800),
                          ));
                        },
                        child: const Text(
                          // text inside add to cart button
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
            ],
          ),
        ),
      ),
    );
  }
}
