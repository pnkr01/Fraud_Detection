class Category {
  final int id;
  final String name;
  final String images;
  Category({
    required this.id,
    required this.name,
    required this.images,
  });
}

List<Category> democategory = [
  Category(id: 5, name: 'Women', images: 'assets/images/women.png'),
  Category(id: 1, name: 'Man', images: 'assets/images/icon.png'),
  Category(id: 2, name: 'Moiles', images: 'assets/images/mobile.png'),
  Category(id: 3, name: 'Electronics', images: 'assets/images/laptop.png'),
  Category(id: 4, name: 'Grocery', images: 'assets/images/grocery.png'),
  Category(id: 4, name: 'Sports', images: 'assets/images/icon.png'),
];
