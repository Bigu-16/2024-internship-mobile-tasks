import 'package:clean_app/features/ecommerce/data/model/product_model.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/domain/usecases/insert_product.dart';
import 'package:clean_app/features/ecommerce/domain/usecases/update_product.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/add_and_update/add_and_update_event.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/add_and_update/add_and_update_state.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBloc extends Bloc<AddorUpdateEvent,AddorUpdateState>{
  InsertProduct insertProduct;

  AddBloc({required this.insertProduct}):super(FetchInitial()){
    on<AddData>((event, emit) async{
      try{
        final product = ProductModel(
          id: event.id, 
          name: event.name, 
          price: event.price, 
          description: event.description, 
          imageUrl: event.imageUrl);
        final result = await insertProduct(product);

        result.fold(
          ((failure)=> emit(AddorUpdateFailure(failure.message))),
          ((product)=> emit(AddorUpdateSuccess(product))),
        );
      }catch(e){
      emit(AddorUpdateFailure("Failed to add data"));
    }
    } );
  }
}

class UpdateBloc extends Bloc<AddorUpdateEvent,AddorUpdateState>{
  UpdateProduct updateProduct;


  UpdateBloc({required this.updateProduct}) : super(FetchInitial()){
    on<AddData>((event, emit) async{
      try{
        final product = ProductModel(
          id: event.id, 
          name: event.name, 
          price: event.price, 
          description: event.description, 
          imageUrl: event.imageUrl);

        final result = await updateProduct(product);
        result.fold(
          ((failure)=> emit(AddorUpdateFailure(failure.message))),
          ((product)=> 
            emit(AddorUpdateSuccess(product))

            ),
        );
      }catch(e){
      emit(AddorUpdateFailure("Failed to add data"));
    }
    },);
  }
}

