import 'package:clean_app/features/ecommerce/domain/entities/product.dart';

abstract class SearchState{}

class SearchInitial extends SearchState{}

class SearchLoading extends SearchState{}

class SearchSuccess extends SearchState{
  final List<Product> filteredProducts;
  SearchSuccess(this.filteredProducts);
}

class SearchLoaded extends SearchState{
  final List<Product> products;
  SearchLoaded({required this.products});
}

class SearchFailure extends SearchState{
  late final String message;
  SearchFailure(this.message);
}