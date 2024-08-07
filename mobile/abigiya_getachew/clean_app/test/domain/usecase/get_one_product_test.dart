import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/domain/entities/product.dart';
import 'package:clean_app/features/domain/usecases/get_one_product.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  late GetOneProduct getOneProduct;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    getOneProduct = GetOneProduct(mockProductRepository);
  });

  const testProducts = Product(id: 1, name: 'shoe', category: 'leather', price: 50, rating: 4.0, description: 'mejid said it is used for covering your feet', imageUrl: 'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800');

  const testProductId = 2; 

  test('should get products from the repository', () async{
    when(
      mockProductRepository.getOneProduct(testProductId as int?)
    ).thenAnswer((_) async => const Right(testProducts));

    final result = await getOneProduct(testProductId as int);

    expect(result, const Right(testProducts));
  });

  const Failure testFailure =  Failure('error');
  test('should get error', () async{
    when(
      mockProductRepository.getOneProduct(testProductId as int?)
    ).thenAnswer((_) async => const Left(testFailure));

    final result = await getOneProduct(testProductId as int);

    expect(result, const Left(testFailure));
  });
}