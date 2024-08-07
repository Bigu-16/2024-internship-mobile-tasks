import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository{
  Future<Either<Failure,Product>> getOneProduct(int id);

  Future<Either<Failure, void>> deleteProduct(int id);

  Future<Either<Failure, void>> addProduct(Product product);

  Future<Either<Failure, List<Product>>> getAllProducts();

  Future<Either<Failure,void>> updateProduct(Product product);
}