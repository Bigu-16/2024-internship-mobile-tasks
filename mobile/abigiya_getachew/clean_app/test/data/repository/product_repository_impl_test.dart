import 'dart:io';

import 'package:clean_app/core/error/exception.dart';
import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/data/datasource/remote_data_source.dart';
import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:clean_app/features/ecommerce/data/repositories/product_repository_impl.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  late ProductRepositoryImpl productRepositoryImpl;
  late MockProductRemoteDataSource mockProductRemoteDataSource;

  setUp((){
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    productRepositoryImpl = ProductRepositoryImpl(productRemoteDataSource: mockProductRemoteDataSource);
  });

  const testProductModle = ProductModel(
    id: '1',
    name: 'shoe',
    price: 3.0,
    description: 'brand new ethiopian leather shoe',
    imageUrl:'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800'
  );

  const testProduct = Product(
    id: '1',
    name: 'shoe',
    price: 3.0,
    description: 'brand new ethiopian leather shoe',
    imageUrl:'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800'
  );

  group('get one product', () {
    test('should return one product when when the data source is called', () async{
      when(mockProductRemoteDataSource.getOneProduct(testProduct.id)).thenAnswer(
        (_) async => testProductModle);

      final result = await productRepositoryImpl.getOneProduct(testProduct.id);

      expect(result, equals(const Right(testProductModle)));
    });

    test('should return server failure', () async{
      when(mockProductRemoteDataSource.getOneProduct(testProduct.id)).thenThrow(
        ServerException('An error has occured')
      );
      final result = await productRepositoryImpl.getOneProduct(testProduct.id);

      expect(result, equals(const Left(ServerFailure('An error has occured'))));
    });
    test('should return connection failure', () async{
      when(mockProductRemoteDataSource.getOneProduct(testProduct.id)).thenThrow(
        SocketException('error')
      );
      final result = await productRepositoryImpl.getOneProduct(testProduct.id);

      expect(result, equals(const Left(ConnectionFailure('Failed to connect to the network'))));
    });
  }
  );
}