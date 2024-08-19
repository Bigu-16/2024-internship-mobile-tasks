import 'package:clean_app/features/ecommerce/domain/entities/product.dart';

class SearchEvent{}

class SearchPressed extends SearchEvent{}

class FilterApplied extends SearchEvent{
  List<Product> allpoduct;
  final String searchTerm;
  FilterApplied(this.searchTerm,this.allpoduct);
}
class HoldData extends SearchEvent{
  final List<Product> products;
  HoldData(this.products);
}