import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteProduct{
  final ProductRepository productRepository;
  
  const DeleteProduct(this.productRepository);

  Future<Either<Failure,void>> call(String id) {
    return productRepository.deleteProduct(id);
  }
}