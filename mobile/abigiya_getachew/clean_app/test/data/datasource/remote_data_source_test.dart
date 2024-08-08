import 'package:clean_app/core/constants/constants.dart';
import 'package:clean_app/core/error/exception.dart';
import 'package:clean_app/features/ecommerce/data/datasource/remote_data_source.dart';
import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  late MockHttpClient mockHttpClient;
  late ProductRemoteDataSourceImpl productRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    productRemoteDataSourceImpl =
        ProductRemoteDataSourceImpl(client: mockHttpClient);
  });

  const testId = '2';

  group('get product model', () {
    test('should return product model when the response is 200', () async {
      when(mockHttpClient.get(Uri.parse(Urls.getProductById(testId))))
          .thenAnswer((_) async => http.Response(
              readJson('helpers/dummy_data/dummy_product_response.json'), 200));

      final result = await productRemoteDataSourceImpl.getOneProduct(testId);

      expect(result, isA<ProductModel>());
    });

    test('should get an error message 404', () async {
      when(mockHttpClient.get(Uri.parse(Urls.getProductById(testId))))
          .thenAnswer((_) async => http.Response('Not found', 400));

      final result = productRemoteDataSourceImpl.getOneProduct;

      expect(() async => await result(testId), throwsA(isA<ServerException>()));
    });
  });

  group('get all products', () {
    test('should return product model', () async {
      when(mockHttpClient.get(Uri.parse(Urls.baseUrl))).thenAnswer((_) async =>
          http.Response(
              readJson('helpers/dummy_data/dummy_product_response.json'), 200));

      final result = await productRemoteDataSourceImpl.getAllProduct();

      expect(result, isA<ProductModel>());
    });

    test('should return error message', () async {
      when(mockHttpClient.get(Uri.parse(Urls.baseUrl)))
          .thenAnswer((_) async => http.Response('Not found', 404));

      final result = productRemoteDataSourceImpl.getAllProduct;

      expect(() async => result(), throwsA(isA<ServerException>()));
    });
  });

  const testProductModel = ProductModel(
      id: '1',
      name: 'shoe',
      price: 3.0,
      description: 'brand new ethiopian leather shoe',
      imageUrl:
          'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800');

  group('insert product', () {
    test('should insert a product', () async {
      when(mockHttpClient.post(Uri.parse(Urls.baseUrl),body: testProductModel.toJson()))
          .thenAnswer((_) async => http.Response(
              readJson('helpers/dummy_data/dummy_product_response.json'), 201));

      final result = await productRemoteDataSourceImpl.insertProduct(testProductModel);

      expect(result, isA<ProductModel>());
    });

    test('should return error message', () async {
      when(mockHttpClient.post(Uri.parse(Urls.baseUrl), body: testProductModel.toJson()))
          .thenAnswer((_) async => http.Response('Not found', 404));

      final result = productRemoteDataSourceImpl.insertProduct(testProductModel);

      expect(() async => result, throwsA(isA<ServerException>()));
    });
  });

  group('test for updating product', () {
    test('should update a product', () async {
      when(mockHttpClient.put(Uri.parse(Urls.getProductById(testProductModel.id)),body: testProductModel.toJson()))
          .thenAnswer((_) async => http.Response(
              readJson('helpers/dummy_data/dummy_product_response.json'), 200));

      final result = await productRemoteDataSourceImpl.updateProduct(testProductModel);

      expect(result, isA<ProductModel>());
    });

    test('should return error message', () async {
      when(mockHttpClient.put(Uri.parse(Urls.getProductById(testProductModel.id)), body: testProductModel.toJson()))
          .thenAnswer((_) async => http.Response('Not found', 404));

      final result = productRemoteDataSourceImpl.updateProduct(testProductModel);

      expect(() async => result, throwsA(isA<ServerException>()));
    });
  });
const testid="1";
    group('test for deleting product', () {
    test('should delete a product', () async {
      when(mockHttpClient.delete(Uri.parse(Urls.getProductById(testProductModel.id))))
          .thenAnswer((_) async => http.Response(
              'Successfully deleted', 200));

      final result = await productRemoteDataSourceImpl.deleteProduct(testProductModel.id);

      expect(result, isA<String>());
    });

    test('should return error message', () async {
      when(mockHttpClient.delete(Uri.parse(Urls.getProductById(testProductModel.id))))
          .thenAnswer((_) async => http.Response('Not found', 404));

      final result = productRemoteDataSourceImpl.deleteProduct(testProductModel.id);

      expect(() async => result, throwsA(isA<ServerException>()));
    });
  });
}



