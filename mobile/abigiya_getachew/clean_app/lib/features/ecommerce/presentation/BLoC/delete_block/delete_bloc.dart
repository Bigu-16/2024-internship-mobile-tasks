// import 'package:clean_app/features/ecommerce/domain/usecases/delete_product.dart';
// import 'package:clean_app/features/ecommerce/presentation/BLoC/delete_block/delete_event.dart';
// import 'package:clean_app/features/ecommerce/presentation/BLoC/delete_block/delete_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class DeleteBloc extends Bloc<DeleteState,DeleteEvent>{
//   late final DeleteProduct deleteProduct;

//   DeleteBloc(this.deleteProduct) : super(DeleteLoding()){
//     on<DeleteData>((event, emit) async {
//       try{
//         final result = await deleteProduct();

//       }catch(e){
//         emit(DeleteFailure('Failed to delete'));
//       }
//     },);
//   }
  
// }