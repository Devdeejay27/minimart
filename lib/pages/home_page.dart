import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          // search bar
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE2E8F0)),
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.search,
                  color: Color(0xFF94A3B8),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Search...',
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
          ),
          const SizedBox(height: 20),
          const Text(
            'Smartphones, Laptops & Acessories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF000000),
            ),
          )
        ],
      ),
    );
  }
}
