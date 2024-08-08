import 'dart:convert';

import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/json_reader.dart';

void main(){

  const testProductModel = ProductModel(
    id: '1', name: 'shoe', 
    price: 3.0, 
    description: 'brand new ethiopian leather shoe', 
    imageUrl: 'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800');
  test('should be a subclass of a product entity', ()async{
    expect(testProductModel, isA<Product>());
  }
  );

  test('should return valid model from json', ()async{ 
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_product_response.json')
    );
    final List<dynamic> productList = jsonMap['data'];
    final Map<String,dynamic> productJson = productList[0];

    final result = ProductModel.fromJson(productJson);

    expect(result, equals(testProductModel));
  });
  
  test('should return a json map containing a proper data', ()async{
    final result = testProductModel.toJson();

    final expectedJsonMap = {
      'id': '1',
      'name': 'shoe',
      'price': 3.0,
      'description': 'brand new ethiopian leather shoe',
      'imageUrl': 'https://images.pexels.com/photos/256198/pexels-photo-256198.jpeg?auto=compress&cs=tinysrgb&w=800',
    };

    expect(result, equals(expectedJsonMap));
  });
}