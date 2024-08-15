import 'package:clean_app/core/platform/newtwork_info.dart';
import 'package:clean_app/features/ecommerce/data/datasource/local_data_source.dart';
import 'package:clean_app/features/ecommerce/data/datasource/remote_data_source.dart';
import 'package:clean_app/features/ecommerce/data/repositories/product_repository_impl.dart';
import 'package:clean_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:clean_app/features/ecommerce/domain/usecases/delete_product.dart';
import 'package:clean_app/features/ecommerce/domain/usecases/get_all_products.dart';
import 'package:clean_app/features/ecommerce/domain/usecases/get_one_product.dart';
import 'package:clean_app/features/ecommerce/domain/usecases/insert_product.dart';
import 'package:clean_app/features/ecommerce/domain/usecases/update_product.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/add_and_update/add_and_update_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final  getIt = GetIt.instance;

Future<void> setup() async {
  var client = http.Client();
  var internetChechker = InternetConnectionChecker();
  var sharedPreferences = await SharedPreferences.getInstance();
  
  getIt.registerSingleton<InternetConnectionChecker>(internetChechker);
  getIt.registerFactory<NetworkInfo>(()=>NetworkInfoImpl(internetChechker));
  getIt.registerLazySingleton<ProductRemoteDataSource>(()=>
      ProductRemoteDataSourceImpl(client: client));
  getIt.registerLazySingleton<ProductLocalDataSource>(()=>
      ProductLocalDatasourceImp(sharedPreferences: sharedPreferences));
  getIt.registerLazySingleton<ProductRepository>(()=>ProductRepositoryImpl(
      productRemoteDataSource: getIt(),
      networkInfo: getIt(),
      productLocalDatasource: getIt()));
  getIt.registerLazySingleton<GetAllProducts>(()=>
      GetAllProducts(productRepository: getIt()));
  getIt.registerLazySingleton<GetOneProduct>(()=>GetOneProduct(getIt()));
  getIt.registerLazySingleton<InsertProduct>(()=>
      InsertProduct(productRepository: getIt()));
  getIt.registerLazySingleton<UpdateProduct>(()=>UpdateProduct(getIt()));
  getIt.registerLazySingleton<DeleteProduct>(()=>DeleteProduct(getIt()));
  getIt.registerLazySingleton<HomePageBloc>(()=>HomePageBloc(getAllProducts: getIt()));
  getIt.registerLazySingleton<AddBloc>(()=>AddBloc(insertProduct: getIt()));
  getIt.registerLazySingleton<UpdateBloc>(()=>UpdateBloc(updateProduct: getIt()));
}
