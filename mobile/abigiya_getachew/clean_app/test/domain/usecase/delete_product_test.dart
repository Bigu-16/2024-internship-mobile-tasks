import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/domain/usecases/delete_product.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  late DeleteProduct deleteProduct;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    deleteProduct = DeleteProduct(mockProductRepository); 
  });

  // const testDeleteProduct = Product(id: 1, name: 'shoe', category: 'leather', price: 50, rating: 4.0, description: 'mejid said it is used for covering your feet');
  const testId = '1';

  test('should delete from the list', () async{
    when(mockProductRepository.deleteProduct(testId)
    ).thenAnswer((_) async => Right(unit));

    final result = await deleteProduct(testId);

    expect(result, Right(unit));
  });

  Failure testFailure = Failure('error deleting a product');

  test('error deleting a product', () async{
    when(
      mockProductRepository.deleteProduct(testId)
    ).thenAnswer((_) async => Left(testFailure));

    final result = await deleteProduct(testId);

    expect(result, Left(testFailure));
  });
}