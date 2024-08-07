import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/domain/entities/product.dart';
import 'package:clean_app/features/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateProduct{
  final ProductRepository productRepository;

  const UpdateProduct(this.productRepository);

  Future<Either<Failure,void>> call(Product product){
    return productRepository.updateProduct(product);
  }
}