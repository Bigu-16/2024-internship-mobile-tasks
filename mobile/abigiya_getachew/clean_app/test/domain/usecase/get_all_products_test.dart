import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/domain/usecases/get_all_products.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  late GetAllProducts getAllProducts;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    getAllProducts = GetAllProducts(mockProductRepository);
  });

  List<Product> testProductList = <Product>[
    const Product(id: '1', name: 'shoe', price: 50, description: 'mejid said it is used for covering your feet',imageUrl: 'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800'),
    const Product(id: '2', name: 'tie', price: 30, description: 'mejid said it is used for tying your neck', imageUrl: 'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800'),
    const Product(id: '3', name: 'shorts', price: 40, description: 'mejid said it is used for covering your lower body', imageUrl: 'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800')
  ];

  test('should return list of products', ()async{
    when(
      mockProductRepository.getAllProducts()
      ).thenAnswer((_) async => Right(testProductList));

      final result = await getAllProducts();

      expect(result, Right(testProductList));
  });

  const testFailure = Failure('error');
  test('should return error', ()async{
    when(
      mockProductRepository.getAllProducts()
    ).thenAnswer((_) async => Left(testFailure));

    final result = await getAllProducts();

    expect(result, Left(testFailure));
  });
}