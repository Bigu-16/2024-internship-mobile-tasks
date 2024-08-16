import 'package:clean_app/features/ecommerce/domain/usecases/delete_product.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/delete_block/delete_event.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/delete_block/delete_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteBloc extends Bloc<DeleteEvent,DeleteState>{
  final DeleteProduct deleteProduct;

  DeleteBloc({required this.deleteProduct}) : super(DeleteLoading()){
    on<DeleteData>((event, emit) async {
      emit(DeleteLoading());
      try{
        final result = await deleteProduct(event.id);

        result.fold((failure){
          emit(DeleteFailure(failure.message));
        }, (success){
          emit(DeleteSuccess('Successfully deleted'));
        });

      }catch(e){
        emit(DeleteFailure('Failed to delete'));
      }
    });
  }
  
}