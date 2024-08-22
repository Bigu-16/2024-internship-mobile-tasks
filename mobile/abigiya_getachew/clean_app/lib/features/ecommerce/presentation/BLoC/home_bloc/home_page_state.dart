import '../../../domain/entities/product.dart';

abstract class HomePageState{}

class FetchLoading extends HomePageState{}

class FetchSuccess extends HomePageState{
  late final List<Product> product;
  FetchSuccess(this.product);
}

class FetchFailure extends HomePageState{
  late final String failure;
  FetchFailure(this.failure);
}

class LogoutSuccess extends HomePageState{
  late final String message;
  LogoutSuccess(this.message);
}