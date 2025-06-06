import 'package:flutter/material.dart';
import 'package:minimart/components/bottom_nav_bar.dart';
import 'package:minimart/models/cart.dart';
import 'package:minimart/models/product.dart';
import 'package:minimart/pages/product_details.dart';
import 'package:minimart/pages/cart_page.dart';
import 'package:provider/provider.dart';

// list of products for sale
final List<Product> productShop = [
  Product(
    id: 'p1',
    name: 'Apple iPhone 16 128GB|Teal',
    imagePath: 'lib/images/iphone 16 teal.png',
    description:
        "• This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers. \n• There will be no visible cosmetic imperfections when held at an arm's length.",
    price: 700.00,
  ),
  Product(
    id: 'p2',
    name: 'M4 Macbook Air 13" 256GB|Sky blue',
    imagePath: 'lib/images/macbook air.jpg',
    description: '',
    price: 1000.00,
  ),
  Product(
    id: 'p3',
    name: 'Google Pixel 9A 128GB|Iris',
    imagePath: 'lib/images/google pixel.png',
    description: '',
    price: 499.00,
  ),
  Product(
    id: 'p4',
    name: 'Apple Airpods 4 Active Noise Cancellation',
    imagePath: 'lib/images/apple airpods.jpg',
    description: '',
    price: 129.00,
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  Set<String> cartCounter = {}; // Store unique product IDs in cart

  // to get cart count
  int get cartCount => Provider.of<Cart>(context, listen: false).itemCount;

  // method for tapping any item on nav bar
  void onItemTapped(int index) async {
    if (index == 1) {
      // Navigate to cart page,if not already selected
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CartPage()),
      );
      // After returning from cart, set selectedIndex to home (0)
      setState(() {
        selectedIndex = 0;
      });
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        cartCount: cartCount,
        onItemTapped: onItemTapped,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Custom AppBar Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Full Logo
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
                        const Spacer(),
                        // Delivery Address
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'DELIVERY ADDRESS',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF334155),
                                fontFamily: 'IBM Plex Sans',
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Umuezike Road, Oyo State',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF334155),
                                fontFamily: 'IBM Plex Sans',
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // Notification Icon
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Search bar
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Color(0xFF94A3B8),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Search...',
                            style: TextStyle(
                              color: Color(0xFFCBD5E1),
                              fontFamily: 'IBM Plex Sans',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    // Divider after search bar
                    const Divider(
                      thickness: 1,
                      color: Color(0xFFE2E8F0),
                    ),
                    const SizedBox(height: 10),
                    // Technology row
                    const Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 10,
                          color: Color(0xFF64748B),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Technology',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF000000),
                            fontFamily: 'IBM Plex Sans',
                          ),
                        ),
                      ],
                    ),

                    // Faint dividing line
                    const Divider(
                      thickness: 0.1,
                      color: Color(0xFFE2E8F0),
                    ),
                    const SizedBox(height: 8),
                    // Subtitle
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Smartphones, Laptops & Accessories',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                          fontFamily: 'IBM Plex Sans',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // GridView Section
              Padding(
                padding: const EdgeInsets.all(10),
                // builds a grid view for the products
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: productShop.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final product = productShop[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GestureDetector(
                          // what happens when you tap any product
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ProductDetails.routeName,
                              arguments: product,
                            );
                          },
                          // displaying the image
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.62),
                            child: Image.asset(
                              product.imagePath,
                              fit: BoxFit.cover,
                              height: 145,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // the product name
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000),
                            fontFamily: 'IBM Plex Sans',
                          ),
                        ),
                        const SizedBox(height: 4),
                        // the product price
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontFamily: 'IBM Plex Sans',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 80), // Space for bottom nav bar
            ],
          ),
        ),
      ),
    );
  }
}
