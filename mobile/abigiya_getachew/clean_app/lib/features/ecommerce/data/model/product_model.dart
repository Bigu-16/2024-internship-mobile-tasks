import 'package:clean_app/features/ecommerce/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required String id,
    required String name,
    required String category,
    required double price,
    required double rating,
    required String description,
    required String imageUrl,
  }) : super(
            id: id,
            name: name,
            category: category,
            price: price,
            rating: rating,
            description: description,
            imageUrl: imageUrl);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '');

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'category': category,
    'price': price,
    'rating': rating,
    'description': description,
    'imageUrl': imageUrl,
  };
}
