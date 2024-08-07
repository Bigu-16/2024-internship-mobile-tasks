import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllProducts{
  final ProductRepository productRepository;

  const GetAllProducts(this.productRepository);

  Future<Either<Failure,List<Product>>> call() async{
    return await productRepository.getAllProducts();
  }
}