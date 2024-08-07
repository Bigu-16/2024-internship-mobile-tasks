import 'package:clean_app/features/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required int id,
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
}
