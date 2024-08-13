import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateProduct{
  final ProductRepository productRepository;

  const UpdateProduct(this.productRepository);

  Future<Either<Failure,Product>> call(ProductModel product){
    return productRepository.updateProduct(product);
  }
}