import 'package:flutter/material.dart';
import 'package:minimart/models/product.dart';
import 'package:minimart/pages/product_details.dart';

// list of products for sale
final List<Product> productShop = [
  Product(
    id: 'p1',
    name: 'Apple iPhone 16 128 GB|Teal',
    imagePath: 'lib/images/iphone 16 teal.png',
    description:
        "This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.There will be no visible cosmetic imperfections when held at an arm’s length.",
    price: 700.00,
  ),
  Product(
    id: 'p2',
    name: 'M4 Macbook Air 13" 256GB|Sky blue ',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Custom AppBar Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Stack(
                  children: [
                    // Notification Icon at top right
                    Positioned(
                      right: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none),
                      ),
                    ),
                    Column(
                      children: [
                        // Delivery address centered
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'DELIVERY ADDRESS',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF334155),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Umuezike Road, Oyo State',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF334155),
                                  ),
                                ),
                              ],
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
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Divider(),
                        const SizedBox(height: 12),
                        // Technology row
                        const Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 10,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Technology',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // GridView Section
              Padding(
                padding: const EdgeInsets.all(10),
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ProductDetails.routeName,
                          arguments: product,
                        );
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.62),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(15)),
                                child: Image.asset(
                                  product.imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
