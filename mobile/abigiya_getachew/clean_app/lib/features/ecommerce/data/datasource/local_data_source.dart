import 'package:clean_app/features/ecommerce/data/model/product_model.dart';

abstract class ProductLocalDataSource{
  Future<ProductModel> getOneProduct(String id);

  Future<ProductModel> getAllProducts();
  Future<ProductModel> cacheProductModel(ProductModel productToCache);
  Future<ProductModel> updateProductModel(ProductModel product);
  Future<void> deleteProductModel(String id);
}