import 'package:equatable/equatable.dart';

class Product extends Equatable{
  const Product(
    {
      required this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.rating,
      required this.description,
      required this.imageUrl,
    }
  );

  final String id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final String description;
  final String imageUrl;

  @override
  List<Object?> get props => [
    id,
    name,
    category,
    price,
    rating,
    description,
    imageUrl,
  ];
}