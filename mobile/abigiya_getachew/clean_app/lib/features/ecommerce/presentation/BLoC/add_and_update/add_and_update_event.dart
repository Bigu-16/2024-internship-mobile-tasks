import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

class AddorUpdateEvent{}

class AddData extends AddorUpdateEvent{

  AddData(
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
}
class UpdateData extends AddorUpdateEvent{}
