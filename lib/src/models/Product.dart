import 'package:flutter/material.dart';

class Product {
  final int id;
  final int nid;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular, isNew;

  Product({
    required this.id,
    required this.nid,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    this.isNew = false,
    required this.title,
    required this.price,
    required this.description,
  });
}
// Our demo Products

List<Product> demoProducts = [
  Product(
    nid: 0,
    id: 10,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    nid: 1,
    id: 11,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 800.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    nid: 2,
    id: 12,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    nid: 3,
    id: 13,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 920.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

List<Product> demoNewInProduct = [
  Product(
      nid: 4,
      id: 14,
      images: [
        "assets/images/ps4_console_white_1.png",
        "assets/images/ps4_console_white_2.png",
        "assets/images/ps4_console_white_3.png",
        "assets/images/ps4_console_white_4.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Wireless Controller for PS4™",
      price: 75.99,
      description: description,
      rating: 4.8,
      isFavourite: true,
      isPopular: true,
      isNew: true),
  Product(
      nid: 5,
      id: 15,
      images: [
        "assets/images/Image Popular Product 2.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Nike Sport White - Man Pant",
      price: 655.5,
      description: description,
      rating: 4.1,
      isPopular: true,
      isNew: true),
  Product(
      nid: 6,
      id: 16,
      images: [
        "assets/images/glap.png",
      ],
      colors: [
        const Color(0xFFF6625E),
        const Color(0xFF836DB8),
        const Color(0xFFDECB9C),
        Colors.white,
      ],
      title: "Gloves XC Omega - Polygon",
      price: 215.55,
      description: description,
      rating: 4.1,
      isFavourite: true,
      isPopular: true,
      isNew: true),
  Product(
    nid: 7,
    id: 17,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 987.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
