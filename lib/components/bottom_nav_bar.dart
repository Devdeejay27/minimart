import 'package:flutter/material.dart';

// bottom bar on home page
class BottomNavBar extends StatelessWidget {
  final int selectedIndex; //for the particular page  it is on
  final int cartCount; //no. of items in cart
  final Function(int) onItemTapped; //when any of the icons are tapped

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.cartCount,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    // List of icons and labels
    final navItems = [
      {'icon': Icons.add_home_outlined, 'label': 'Home'},
      {'icon': Icons.shopping_cart_outlined, 'label': 'Cart'},
      {'icon': Icons.favorite_border, 'label': 'Favorites'},
      {'icon': Icons.person_pin_circle_outlined, 'label': 'Profile'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 24,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navItems.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onItemTapped(index),
            child: Container(
              height: 56,
              width: 64,
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 32,
                    width: 56,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 32,
                          width: 56,
                          // the fill colour if any is selected
                          decoration: isSelected
                              ? BoxDecoration(
                                  color: const Color(0xFF60B5FF),
                                  borderRadius: BorderRadius.circular(16),
                                )
                              : null,
                          alignment: Alignment.center,
                          child: Icon(
                            navItems[index]['icon'] as IconData,
                            color: isSelected ? Colors.white : Colors.black,
                            size: 24,
                          ),
                        ),
                        // Cart icon count: show only if cart is not empty
                        if (index == 1 && cartCount > 0)
                          Positioned(
                            right: 6,
                            top: -2,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: Center(
                                child: Text(
                                  '$cartCount',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    navItems[index]['label'] as String,
                    style: TextStyle(
                      color:
                          isSelected ? const Color(0xFF60B5FF) : Colors.black,
                      fontSize: 12,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
