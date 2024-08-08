import 'package:clean_app/features/ecommerce/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required String id,
    required String name,
    required double price,
    required String description,
    required String imageUrl,
  }) : super(
            id: id,
            name: name,
            price: price,
            description: description,
            imageUrl: imageUrl);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '');

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'description': description,
    'imageUrl': imageUrl,
  };
}
