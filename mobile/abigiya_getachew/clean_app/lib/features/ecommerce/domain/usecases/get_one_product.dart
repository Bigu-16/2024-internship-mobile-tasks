import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class GetOneProduct{
  final ProductRepository productRepository;

  const GetOneProduct(this.productRepository);

  Future<Either<Failure,Product>> call(String id) async{
    return await productRepository.getOneProduct(id);
  }

}