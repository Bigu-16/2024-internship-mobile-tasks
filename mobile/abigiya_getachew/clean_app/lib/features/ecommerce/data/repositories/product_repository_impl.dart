import 'dart:io';

import 'package:clean_app/core/error/exception.dart';
import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/data/datasource/remote_data_source.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl extends ProductRepository{
  late final ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({required this.productRemoteDataSource});

  @override
  Future<Either<Failure, Product>> getOneProduct(String id) async {
    try{
      final result = await productRemoteDataSource.getOneProduct(id);
      return Right(result);
    }on ServerException{
      return const Left(ServerFailure('An error has occured'));
    } on SocketException{
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }



  @override
  Future<Either<Failure, void>> insertProduct(Product product) {
    // TODO: implement insertProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateProduct(Product product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
  

  @override
  Future<Either<Failure, void>> deleteProduct(String id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
}