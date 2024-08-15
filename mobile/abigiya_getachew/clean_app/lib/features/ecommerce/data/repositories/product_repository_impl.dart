import 'dart:io';

import 'package:clean_app/core/error/exception.dart';
import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/core/platform/newtwork_info.dart';
import 'package:clean_app/features/ecommerce/data/datasource/local_data_source.dart';
import 'package:clean_app/features/ecommerce/data/datasource/remote_data_source.dart';
import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:clean_app/features/ecommerce/domain/usecases/insert_product.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProductRepositoryImpl extends ProductRepository{
  late final ProductRemoteDataSource productRemoteDataSource;
  late final NetworkInfo networkInfo;
  late final ProductLocalDataSource productLocalDatasource;
  ProductRepositoryImpl({
    required this.productRemoteDataSource,
    required this.networkInfo,
    required this.productLocalDatasource
    });

  @override
  Future<Either<Failure, Product>> getOneProduct(String id) async {

    if (await networkInfo.isConnected){
    try{
      final result = await productRemoteDataSource.getOneProduct(id);
      return Right(result.toEntity());
    }on ServerException{
      return const Left(ServerFailure('An error has occured'));
    } on SocketException{
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
    }
    else{
      final result = await productLocalDatasource.getOneProduct(id);
      return Right(result.toModel());
    }
  }

  @override
Future<Either<Failure, List<ProductModel>>> getAllProducts() async {
 if (await networkInfo.isConnected){
   try {
    final result = await productRemoteDataSource.getAllProducts();
    // Convert List<ProductModel> to List<Product>
    final products = result.map((model) => model.toModel()).toList();
    return Right(products);
  } on ServerException {
    return const Left(ServerFailure('An error has occurred'));
  } on SocketException {
    return const Left(ConnectionFailure('Failed to connect to the network'));
  }
  }else{
    final result = await productLocalDatasource.getAllProducts();
    return Right(result);
  }
}


  
  @override
  Future<Either<Failure, ProductModel>> insertProduct(ProductModel product) async {
    if (await networkInfo.isConnected){
      try {
      final result = await productRemoteDataSource.insertProduct(product);
      return Right(result);
    } catch (error) {
      print("$error error");
      return Left(ServerFailure("an error occured"));
    }
    }else{
      final result = await productLocalDatasource.cacheProduct(product);
      return Right(result);
    }
  }
  
  @override
  Future<Either<Failure,Product>> updateProduct(ProductModel product) async{
    if(await networkInfo.isConnected){
      try {
    var result = await productRemoteDataSource.updateProduct(product);
    return(Right(result));
  } on ServerException {
    return const Left(ServerFailure('An error has occurred'));
  } on SocketException {
    return const Left(ConnectionFailure('Failed to connect to the network'));
  }
  }else{
    final result = await productLocalDatasource.updateProductModel(product);
    return(Right(result));
  }
}
  
  @override
  Future<Either<Failure,String>> deleteProduct(String id) async{
    if(await networkInfo.isConnected){
      try {
    var result = await productRemoteDataSource.deleteProduct(id);
    String ans = 'deleted';
    return(Right(ans));
  } on ServerException {
    return const Left(ServerFailure('An error has occurred'));
  } on SocketException {
    return const Left(ConnectionFailure('Failed to connect to the network'));
  }
  }else{
    final result = await productLocalDatasource.deleteProduct(id);
    return(Right(result));
  }
}
}
// Future<void> main() async {
//   // ProductRepositoryImpl imp = ProductRepositoryImpl(productRemoteDataSource: productRemoteDataSource, networkInfo: networkInfo, productLocalDatasource: productLocalDatasource);

//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize the dependencies
//   final httpClient = http.Client();
//   final connectionChecker = InternetConnectionChecker();
//   final sharedPreferences = await SharedPreferences.getInstance();

//   // Create instances of your data sources
//   final productRemoteDataSource = ProductRemoteDataSourceImpl(client: httpClient);
//   final productLocalDataSource = ProductLocalDatasourceImp(sharedPreferences: sharedPreferences);
//   final networkInfo = NetworkInfoImpl(connectionChecker);

//   // Create the repository instance
//   final productRepository = ProductRepositoryImpl(
//     productRemoteDataSource: productRemoteDataSource,
//     networkInfo: networkInfo,
//     productLocalDatasource: productLocalDataSource,
//   );

//   // Create a ProductModel instance
  // const newProduct = ProductModel(
  //   id: '123',
  //   name: 'New Product',
  //   description: 'A description of the new product',
  //   price: 99.99,
  //   imageUrl: 'C:/Users/abget/Pictures/ornate_cross.jpg',
  // );

//   // Call the insertProduct function
//   final result = await productRepository.insertProduct(newProduct);

//   // Handle the result
//   result.fold(
//     (failure) => print('Failed to insert product: ${failure.message}'),
//     (product) => print('Product inserted successfully: ${product.toJson()}'),
//   );
  
// }