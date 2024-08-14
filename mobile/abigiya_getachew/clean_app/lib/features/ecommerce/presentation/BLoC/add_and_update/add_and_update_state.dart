import 'package:clean_app/features/ecommerce/domain/entities/product.dart';

abstract class AddorUpdateState{}

class FetchInitial extends AddorUpdateState{}

class AddorUpdateSuccess extends AddorUpdateState{
  late final Product product;
  AddorUpdateSuccess(this.product);
}

class AddorUpdateFailure extends AddorUpdateState{
  late final String failure;
  AddorUpdateFailure(this.failure);
}