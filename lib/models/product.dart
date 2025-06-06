class Product {
  // requirements for every time a product class is called
  final String id;
  final String name;
  final String imagePath;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.price,
  });
}
