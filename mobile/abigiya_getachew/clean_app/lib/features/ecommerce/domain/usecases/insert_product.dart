import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:clean_app/features/ecommerce/data/repositories/product_repository_impl.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class InsertProduct{
  final ProductRepository productRepository;

  const InsertProduct({required ProductRepositoryImpl this.productRepository});

  Future<Either<Failure,Product>> call(ProductModel product) async{
    return await productRepository.insertProduct(product);
  }
}