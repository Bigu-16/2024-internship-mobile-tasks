import 'dart:convert';
import 'dart:io';

import 'package:clean_app/core/constants/constants.dart';
import 'package:clean_app/core/error/exception.dart';
import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

abstract class ProductRemoteDataSource{
  Future<ProductModel> getOneProduct(String id);
  Future<List<ProductModel>> getAllProducts();
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
  Future<List<ProductModel>> getAllProducts() async{
    try{final response = 
    await client.get(Uri.parse(Urls.baseUrl));

    if(response.statusCode == 200){
      final  jsonList = json.decode(response.body);
      // print(jsonList["data"]);
      return ProductModel.listFromJson(jsonList["data"]);    } 
    else{
      throw ServerException('Failed to load product');
    }} catch(e){
      throw ConnectionFailure('Network error');
    }
  }

  @override
  Future<ProductModel> insertProduct(ProductModel newProduct) async {
    // final response = await client.post(
    //   Uri.parse(Urls.addProductUrl()),
    //   headers: {'Content-Type': 'application/json'},
    //   body: json.encode(product.toJson()),
    // );
    // List<String> imageType= ['jpg','png'];
    try {var request = http.MultipartRequest('POST', Uri.parse(Urls.baseUrl));
    request.files.add(await http.MultipartFile.fromPath('image', File(newProduct.imageUrl).path, contentType: MediaType('image','jpg')));

    // request.fields['name'] = newProduct.name;
    // request.fields['price'] = newProduct.price.toString();
    // request.fields['description'] = newProduct.description;
    request.fields['name'] = newProduct.name;
    request.fields['price'] = newProduct.price.toString();
    request.fields['description'] = newProduct.description;
  
    var response = await client.send(request);
      
   
      if (response.statusCode == 201) {
      // final responseData = await http.Response.fromStream(response);
      final responseData = await response.stream.bytesToString();
    
      final responseJson = json.decode(responseData);
      return ProductModel.fromJson(responseJson);
    } else {
      throw ServerException('Failed to add product');
    }} catch(e){
      throw Exception('error adding product $e');
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async{
    try{
      final productJson = json.encode(product.toJson());
      final id = product.id;
      final getProd = await client.get(Uri.parse(Urls.baseUrl + '/${product.id}'));
      
      final response = 
    await client.put(
      Uri.parse(Urls.baseUrl + '/${product.id}'),
      headers: {'Content-Type': 'application/json'} ,
      body: productJson);

    if (response.statusCode == 200){
      return ProductModel.fromJson(json.decode(response.body)["data"]);
    }
    else{
      throw ServerException('Failed to update product');
    }}catch(e){
      throw ServerException('failed ');
    }
  }

  @override
  Future<String> deleteProduct(String id) async{
    final response = 
    await client.delete(Uri.parse(Urls.getProductById(id)));

    if (response.statusCode == 200){
      return "Successfully deleted";
    }
    else{
      throw ServerException('Failed to delete product');
    }
  }

}

