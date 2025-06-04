class Product {
  final String id;
  final String name;
  final String imagePath;
  final String description;
  final double price;
  final bool inStock;

  Product(
    this.inStock, {
    required this.id,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
  });
}
