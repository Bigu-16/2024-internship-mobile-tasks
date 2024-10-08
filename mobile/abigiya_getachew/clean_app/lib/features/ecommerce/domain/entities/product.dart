import 'package:equatable/equatable.dart';

class Product extends Equatable{
  const Product(
    {
      required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.imageUrl,
      this.category = "Men's",
      this.rating = 4.0,
    }
  );

  final String id;
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  final String category;
  final double rating;

  @override
  List<Object?> get props => [
    id,
    name,
    price,
    description,
    imageUrl,
    category,
    rating,
  ];
}