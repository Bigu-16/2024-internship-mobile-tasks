import 'dart:core';

import 'package:product_app/models/products.dart';


class ProductsRepository {

static List<Product> getAll (){
 
  
  List<Product> allProducts = [
      Product(
          id: 1,
          name: 'Camera',
          price: 100,
          category: 'Lexury',
          rating: 4,
          description: 'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.'),
      Product(
          id: 2,
          name: 'Perfume',
          price: 100,
          category: 'Lexury',
          rating: 4,
          description: 'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.'),
      Product(
          id: 3,
          name: 'Sweater',
          price: 50,
          category: 'Women\'s wear',
          rating: 4,
          description: 'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.'),
      Product(
          id: 4,
          name: 'Tie',
          price: 50,
          category: 'Lexury',
          rating: 4,
          description: 'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.'),
      Product(
          id: 5,
          name: 'Top',
          price: 40,
          category: 'Women\'s wear',
          rating: 4,
          description: 'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.')
      
    ];

     return allProducts;
}
}
