// import 'package:clean_app/core/error/failure.dart';
// import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
// import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
// import 'package:clean_app/features/ecommerce/domain/usecases/update_product.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import '../../helpers/test_helper.mocks.dart';

// Future<void> main() async {
//   late UpdateProduct updateProduct;
//   late MockProductRepository mockProductRepository;

//   setUp((){
//     mockProductRepository = MockProductRepository();
//     updateProduct = UpdateProduct(mockProductRepository);
//   });

//   const testUpdate = ProductModel(id: '1', name: 'shoe', price: 40, description: 'quality shoe', imageUrl: 'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800');

//   test('should update product on the list', ()async{
//     when(
//       mockProductRepository.updateProduct(testUpdate)
//     ).thenAnswer((_) async => Right(unit));

//   final result = await updateProduct(testUpdate);

//   expect(result, Right(unit));
//   // verify(mockProductRepository.updateProduct(testUpdate)).called(1);
//   // verifyNoMoreInteractions(mockProductRepository);
//   });

//   Failure testFailure = Failure('error updating a product');
//     test('error updating a product', ()async{
//     when(mockProductRepository.updateProduct(testUpdate)
//     ).thenAnswer((_) async => Left(testFailure));

//     final result = await updateProduct(testUpdate);

//     expect(result, Left(testFailure));
//   });
// }