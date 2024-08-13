import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository{
  Future<Either<Failure,Product>> getOneProduct(String id);

  Future<Either<Failure, String>> deleteProduct(String id);

  Future<Either<Failure,Product>> insertProduct(ProductModel product);

  Future<Either<Failure, List<Product>>> getAllProducts();

  Future<Either<Failure, Product>> updateProduct(ProductModel product);
}