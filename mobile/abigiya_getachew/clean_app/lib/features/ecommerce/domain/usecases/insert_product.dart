import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class InsertProduct{
  final ProductRepository productRepository;

  const InsertProduct(this.productRepository);

  Future<Either<Failure,void>> call(Product product){
    return productRepository.insertProduct(product);
  }
}