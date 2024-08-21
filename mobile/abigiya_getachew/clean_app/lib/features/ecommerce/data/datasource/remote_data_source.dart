import 'dart:convert';
import 'dart:io';

import 'package:clean_app/core/constants/constants.dart';
import 'package:clean_app/core/error/exception.dart';
import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/authenticatoin/data/data_source/local_data_source.dart';
import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getOneProduct(String id);
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> insertProduct(ProductModel newProduct);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<String> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl(
      {required this.client,
      
});

  @override
  Future<ProductModel> getOneProduct(String id) async {
    final token_result = getCachedToken();
    final response = await client.get(
      Uri.parse(Urls.getProductById(id)),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token_result'
      },
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException('Failed to load product');
    }
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final token_result = await getCachedToken();
      final response = await client.get(
        Uri.parse(Urls.baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token_result'
        },
      );

      if (response.statusCode == 200) {
        final jsonList = json.decode(response.body);
        return ProductModel.listFromJson(jsonList["data"]);
      } else {
        throw ServerException('Failed to load product');
      }
    } catch (e) {
      throw ConnectionFailure('Network error');
    }
  }

  @override
  Future<ProductModel> insertProduct(ProductModel newProduct) async {
    try {
      final token_result = await getCachedToken();
      var request = http.MultipartRequest('POST', Uri.parse(Urls.baseUrl));
      request.files.add(await http.MultipartFile.fromPath(
          'image', File(newProduct.imageUrl).path,
          contentType: MediaType('image', 'jpg')));

      request.fields['name'] = newProduct.name;
      request.fields['price'] = newProduct.price.toString();
      request.fields['description'] = newProduct.description;
      request.headers['Authorization'] = 'Bearer $token_result';

      var response = await client.send(request);

      if (response.statusCode == 201) {
        final responseData = await response.stream.bytesToString();
        final responseJson = json.decode(responseData);

        return ProductModel.fromJson(responseJson);
      } else {
        throw ServerException('Failed to add product');
      }
    } catch (e) {
      throw Exception('error adding product $e');
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    try {
      final token_result = await getCachedToken();
      final productJson = json.encode(product.toJson());
      final id = product.id;
      final getProd = await client.get(
        Uri.parse(Urls.baseUrl + '/${product.id}'),
      );

      final response = await client.put(
          Uri.parse(Urls.baseUrl + '/${product.id}'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token_result'
          },
          body: productJson);

      if (response.statusCode == 200) {
        return ProductModel.fromJson(json.decode(response.body)["data"]);
      } else {
        throw ServerException('Failed to update product');
      }
    } catch (e) {
      throw ServerException('failed ');
    }
  }

  @override
  Future<String> deleteProduct(String id) async {
    final token_result = await getCachedToken();
    final response = await client.delete(
      Uri.parse(Urls.getProductById(id)),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token_result'
      },
    );

    if (response.statusCode == 200) {
      return "Successfully deleted";
    } else {
      throw ServerException('Failed to delete product');
    }
  }

  Future<String?> getCachedToken() async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      
      try {
        final token = sharedPreferences.getString('CACHED_TOKEN');
        print(token);
        if(token != null){
          return token;}
      } catch (e) {
        throw ('error: $e');
      }
    }

}
