import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/domain/entities/product.dart';
import 'package:clean_app/features/domain/usecases/add_product.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

Future<void> main() async {
  late AddProduct addProduct;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    addProduct = AddProduct(mockProductRepository);
  });

  const testAddProduct = Product(id: 1, name: 'shoe', category: 'leather', price: 50, rating: 4.0, description: 'mejid said it is used for covering your feet');



  test('should not return but should add to the list', () async {
    // Arrange
    when(mockProductRepository.addProduct(testAddProduct))
      .thenAnswer((_) async => Right(unit));

    // Act
    final result = await addProduct(testAddProduct);

    // Assert
    expect(result, Right(unit));
    verify(mockProductRepository.addProduct(testAddProduct)).called(1);
    verifyNoMoreInteractions(mockProductRepository);
  });

  Failure testFailure = Failure('error');

  test('error adding prpoduct', ()async{
    when(
      mockProductRepository.addProduct(testAddProduct)
    ).thenAnswer((_) async => Left(testFailure));

    final result = await addProduct(testAddProduct);

    expect(result, Left(testFailure));
  });
}

