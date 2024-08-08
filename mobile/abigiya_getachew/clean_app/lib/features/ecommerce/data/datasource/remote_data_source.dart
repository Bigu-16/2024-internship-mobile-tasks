import 'dart:convert';

import 'package:clean_app/core/constants/constants.dart';
import 'package:clean_app/core/error/exception.dart';
import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource{
  Future<ProductModel> getOneProduct(String id);
  Future<ProductModel> getAllProduct();
  Future<ProductModel> insertProduct(ProductModel newProduct);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<String> deleteProduct(String id);

}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});
  
  @override
  Future<ProductModel> getOneProduct(String id) async{
    final response = 
    await client.get(Uri.parse(Urls.getProductById(id)));

    if(response.statusCode == 200){
      return ProductModel.fromJson(json.decode(response.body));
    } 
    else{
      throw ServerException('Failed to load product');
    }
  }
  @override
  Future<ProductModel> getAllProduct() async{
    final response = 
    await client.get(Uri.parse(Urls.baseUrl));

    if(response.statusCode == 200){
      return ProductModel.fromJson(json.decode(response.body));
    } 
    else{
      throw ServerException('Failed to load product');
    }
  }

  @override
  Future<ProductModel> insertProduct(ProductModel newProduct) async{
    final response = 
    await client.post(Uri.parse(Urls.baseUrl), body: newProduct.toJson());

    if (response.statusCode == 201){
      return ProductModel.fromJson(json.decode(response.body));
    }
    else{
      throw ServerException('Failed to add product');
    }
  }


  @override
  Future<ProductModel> updateProduct(ProductModel product) async{
    final response = 
    await client.put(Uri.parse(Urls.getProductById(product.id)), body: product.toJson());

    if (response.statusCode == 200){
      return ProductModel.fromJson(json.decode(response.body));
    }
    else{
      throw ServerException('Failed to update product');
    }
  }

  @override
  Future<String> deleteProduct(String id) async{
    final response = 
    await client.delete(Uri.parse(Urls.getProductById(id)));

    if (response.statusCode == 200){
      return "Deleted";
    }
    else{
      throw ServerException('Failed to delete product');
    }
  }

}

