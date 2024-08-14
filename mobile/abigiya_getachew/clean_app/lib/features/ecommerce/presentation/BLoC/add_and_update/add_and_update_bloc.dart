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
        final product = Product(
          id: event.id, 
          name: event.name, 
          price: event.price, 
          description: event.description, 
          imageUrl: event.imageUrl);
        final result = await insertProduct();
        result.fold(
          ((failure)=> emit(AddorUpdateFailure(failure.message))),
          ((product)=> emit(AddorUpdateSuccess(product))),
        );
      }catch(e){
      emit(AddorUpdateFailure("Failed to fetch data"));
    }
    } );
  }
}

class UpdateBloc extends Bloc<AddorUpdateEvent,AddorUpdateState>{
  UpdateProduct updateProduct;

}

// HomePageBloc({required this.getAllProducts}):super(FetchLoading()){
//     on<FetchData>((event, emit) async{
//     emit(FetchLoading() );
//     try{
//       final result= await  getAllProducts();
//       result.fold(
//         (failure)=>emit(FetchFailure(failure.message)),
//         (products)=>emit(FetchSuccess(products)),
//       );

    // }catch(e){
    //   emit(FetchFailure("Failed to fetch data"));
    // }
//     }
//     );
//     }