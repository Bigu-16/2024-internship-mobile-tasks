import 'dart:io';

import 'package:clean_app/core/error/exception.dart';
import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/core/platform/newtwork_info.dart';
import 'package:clean_app/features/ecommerce/data/datasource/local_data_source.dart';
import 'package:clean_app/features/ecommerce/data/datasource/remote_data_source.dart';
import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:clean_app/features/ecommerce/data/repositories/product_repository_impl.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';
void main() {
  late ProductRepositoryImpl productRepositoryImpl;
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    mockSharedPreferences = MockSharedPreferences();
    
    productRepositoryImpl = ProductRepositoryImpl(
      productRemoteDataSource: mockProductRemoteDataSource,
      networkInfoImpl: NetworkInfoImpl(InternetConnectionChecker()),
      productLocalDatasource: ProductLocalDatasourceImp(sharedPreferences: mockSharedPreferences),
    );
  });

  const testProductModel = ProductModel(
    id: '1',
    name: 'shoe',
    price: 3.0,
    description: 'brand new ethiopian leather shoe',
    imageUrl: 'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800'
  );

  const testProduct = Product(
    id: '1',
    name: 'shoe',
    price: 3.0,
    description: 'brand new ethiopian leather shoe',
    imageUrl: 'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800'
  );
  
  var testProductList = [const ProductModel(
    id: '1',
    name: 'shoe',
    price: 3.0,
    description: 'brand new ethiopian leather shoe',
    imageUrl: 'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800')];

  group('get one product', () {
    test('should return one product when the data source is called', () async {
      // Mocking the data source to return a ProductModel
      when(mockProductRemoteDataSource.getOneProduct(testProduct.id)).thenAnswer(
        (_) async => testProductModel
      );

      final result = await productRepositoryImpl.getOneProduct(testProduct.id);

      // Expected result should be Product, not ProductModel
      expect(result, equals(Right(testProduct)));
    });

    test('should return server failure', () async {
      when(mockProductRemoteDataSource.getOneProduct(testProduct.id)).thenThrow(
        ServerException('An error has occurred')
      );
      final result = await productRepositoryImpl.getOneProduct(testProduct.id);

      expect(result, equals(Left(ServerFailure('An error has occured'))));
    });

    test('should return connection failure', () async {
      when(mockProductRemoteDataSource.getOneProduct(testProduct.id)).thenThrow(
        SocketException('error')
      );
      final result = await productRepositoryImpl.getOneProduct(testProduct.id);

      expect(result, equals(Left(ConnectionFailure('Failed to connect to the network'))));
    });
  });

  group('get all products', () {
  test('should return all products when the data source is called', () async {
      // Mock the remote data source
      when(mockProductRemoteDataSource.getAllProducts()).thenAnswer(
        (_) async  => testProductList,
      );

      // Call the repository method
      final result = await productRepositoryImpl.getAllProducts();

      // Convert testProductModels to List<Product> for comparison
      final expected = Right(testProductModel);

      // Assert the result
      expect(result, equals(expected));
    });

  test('should return server failure', () async {
    when(mockProductRemoteDataSource.getAllProducts()).thenThrow(
      ServerException('An error has occurred'),
    );

    final result = await productRepositoryImpl.getAllProducts();

    expect(result, equals(Left(ServerFailure('An error has occurred'))));
  });

  test('should return connection failure', () async {
    when(mockProductRemoteDataSource.getAllProducts()).thenThrow(
      SocketException('error'),
    );

    final result = await productRepositoryImpl.getAllProducts();

    expect(result, equals(Left(ConnectionFailure('Failed to connect to the network'))));
  });
});

}

