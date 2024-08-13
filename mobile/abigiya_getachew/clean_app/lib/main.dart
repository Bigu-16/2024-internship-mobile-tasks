import 'dart:io';
import 'dart:ui';

import 'package:clean_app/core/platform/newtwork_info.dart';
import 'package:clean_app/features/ecommerce/data/datasource/local_data_source.dart';
import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:clean_app/features/ecommerce/data/repositories/product_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/ecommerce/data/datasource/remote_data_source.dart';
import 'features/ecommerce/domain/usecases/get_all_products.dart';
import 'features/ecommerce/domain/usecases/insert_product.dart';

void main() async {

  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  File? _image;
  String imagePath = '';

  late final ProductRemoteDataSource remoteDataSource;
  late final ProductRepositoryImpl productRepository;
  late final InsertProduct addProductUsecase;
  late final GetAllProducts getAllProductUsecase;

  @override
  void initState() {
    super.initState();
    _initializeDependencies();
  }

  Future<void> _initializeDependencies() async {
    remoteDataSource = ProductRemoteDataSourceImpl(client : http.Client() );
    final sharedPreferences = await SharedPreferences.getInstance();
    // ProductLocalDataSource localDataSource = LocalDataSource(sharedPreferences: sharedPreferences);
    productRepository = ProductRepositoryImpl(
      productRemoteDataSource: remoteDataSource,
      networkInfoImpl: NetworkInfoImpl(InternetConnectionChecker()),
      productLocalDatasource: ProductLocalDatasourceImp(sharedPreferences: sharedPreferences),
    );
    addProductUsecase = InsertProduct(productRepository: productRepository);
    getAllProductUsecase = GetAllProducts(productRepository: productRepository);
  }

 Future<void> _pickImage() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    setState(() {
      _image = File(pickedFile.path);
      imagePath = pickedFile.path;
    });
  } else {
    debugPrint('No image selected.');
  }
}


  Future<void> _addProduct() async {
    // if (_image != null) {
        final newProduct = ProductModel(
          id: '123',
          name: 'New Product',
          description: 'A description of the new product',
          price: 99.99,
          imageUrl: _image!.path,
        );


      
      File file=File(newProduct.imageUrl);
      var exist=await file.exists();
      

      final result = await addProductUsecase.call(newProduct);
      debugPrint(result.toString());
 
  }

  Future<void> _getAllProducts() async {
    final products = await getAllProductUsecase.call();
    debugPrint(products.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Product Manager')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text("Select Image"),
            ),
            ElevatedButton(
              onPressed: _addProduct,
              child: const Text("Add Product"),
            ),
            ElevatedButton(
              onPressed: _getAllProducts,
              child: const Text("Get All Products"),
            ),
          ],
        ),
      ),
    );
  }
}
