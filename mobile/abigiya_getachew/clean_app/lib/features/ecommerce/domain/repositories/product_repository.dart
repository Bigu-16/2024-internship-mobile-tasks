import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository{
  Future<Either<Failure,Product>> getOneProduct(String id);

  Future<Either<Failure, void>> deleteProduct(String id);

  Future<Either<Failure, void>> insertProduct(Product product);

  Future<Either<Failure, List<Product>>> getAllProducts();

  Future<Either<Failure,void>> updateProduct(Product product);
}