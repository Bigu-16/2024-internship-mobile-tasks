import 'package:clean_app/features/ecommerce/domain/repositories/product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks([
  ProductRepository 
],
customMocks: [MockSpec<http.Client>(as: #MockHttpClient)]
)

void main (){
  
}