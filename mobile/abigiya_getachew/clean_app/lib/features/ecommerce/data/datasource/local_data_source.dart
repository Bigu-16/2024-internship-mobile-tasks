import 'dart:convert';

import 'package:clean_app/core/error/exception.dart';
import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource{
  Future<ProductModel> getOneProduct(String id);
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> cacheProduct(ProductModel productToCache);
  Future<void> cacheProducts(List<ProductModel> productToCache);
  Future<ProductModel> updateProductModel(ProductModel product);
  Future<String> deleteProduct(String id);
}

class ProductLocalDatasourceImp implements ProductLocalDataSource{
final SharedPreferences sharedPreferences;
//{} named parameter when we call the construct we have to 
// shared..: then pass not like positional
ProductLocalDatasourceImp({required  this.sharedPreferences});

//add product
  @override
  Future<ProductModel> cacheProduct(ProductModel productCache)async {
    final jsonString=json.encode(productCache.toJson());
    await sharedPreferences.setString(productCache.id, jsonString);

    return  productCache;
  }


  @override
  Future<ProductModel> getOneProduct(String id) async{
    final jsonString= sharedPreferences.getString(id);
    if (jsonString !=null){
      return Future.value(ProductModel.fromJson(json.decode(jsonString)));
    }else{
      throw CacheException("Failed to get product with id:$id ");
      
    }
  }
  




  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    final Map<String, String> jsonMap={
      for(var product in products) product.id:json.encode(product.toJson())
    };
    await sharedPreferences.setString(
      'CACHED_PRODUCTS', json.encode(jsonMap));
  }



  
  @override
  Future<String> deleteProduct(String id) async {
    final success = await sharedPreferences.remove(id);
    if(!success){
      throw CacheException("Failed to delete product with id:$id ");
    }
    else{
      return ("Successfully deleted");
    }
  }
  
  @override
  Future<List<ProductModel>> getAllProducts() async {
    final jsonstring =sharedPreferences.getString('CACHED_PRODUCTS');
    if (jsonstring !=null){
      final Map<String,dynamic> jsonMap = json.decode(jsonstring);
      final List<ProductModel> products =
      jsonMap.values.map((jsonstring)=>ProductModel.fromJson(json.decode(jsonstring))).toList();
      return Future.value(products);
    }else{
      throw CacheException("no cached products found ");

    }

   
  }
  
  
  @override
  Future<ProductModel> updateProductModel(ProductModel product) {
    throw const ConnectionFailure('No connection for updating a product. Try connecting to the internet.');
  }
  
}
