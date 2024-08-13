import 'package:clean_app/features/ecommerce/data/datasource/local_data_source.dart';
import 'package:clean_app/features/ecommerce/data/datasource/remote_data_source.dart';
import 'package:clean_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  ProductRepository,
  ProductRemoteDataSource,
  SharedPreferences,
],
customMocks: [MockSpec<http.Client>(as: #MockHttpClient)]
)

void main (){
  
}