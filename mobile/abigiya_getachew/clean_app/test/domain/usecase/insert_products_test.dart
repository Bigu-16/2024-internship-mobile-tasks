// import 'package:clean_app/core/error/failure.dart';
// import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
// import 'package:clean_app/features/ecommerce/domain/usecases/insert_product.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import '../../helpers/test_helper.mocks.dart';

// Future<void> main() async {
//   late InsertProduct insertProduct;
//   late MockProductRepository mockProductRepository;

//   setUp((){
//     mockProductRepository = MockProductRepository();
//     insertProduct = InsertProduct(mockProductRepository);
//   });

//   const testAddProduct = ProductModel(id: '1', name: 'shoe', price: 50, description: 'mejid said it is used for covering your feet', imageUrl: 'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800');



//   test('should not return but should add to the list', () async {
//     // Arrange
//     when(mockProductRepository.insertProduct(testAddProduct))
//       .thenAnswer((_) async => Right(unit));

//     // Act
//     final result = await insertProduct(testAddProduct);

//     // Assert
//     expect(result, Right(unit));
//     verify(mockProductRepository.insertProduct(testAddProduct)).called(1);
//     verifyNoMoreInteractions(mockProductRepository);
//   });

//   Failure testFailure = Failure('error');

//   test('error adding prpoduct', ()async{
//     when(
//       mockProductRepository.insertProduct(testAddProduct)
//     ).thenAnswer((_) async => Left(testFailure));

//     final result = await insertProduct(testAddProduct);

//     expect(result, Left(testFailure));
//   });
// }

