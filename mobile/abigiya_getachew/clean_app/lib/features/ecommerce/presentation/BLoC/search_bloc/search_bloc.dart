import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/search_bloc/search_event.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/search_bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent,SearchState>{
  List<Product>? products;

  SearchBloc(): super(SearchInitial()){
    on<HoldData>((event, emit) async{
      emit(SearchLoading());
      try{
        final products = event.products;
        
        emit(SearchLoaded(products: products));
      }catch(e){
        emit(SearchFailure('Failed to load products'));
      }
    });

    on<FilterApplied>((event, emit) {
      emit(SearchLoading());
      try{
        // final filteredProducts = products!.where((product){
        //   return product.name.contains(event.searchTerm);
        // }).toList();
        final product = event.allpoduct;
        
        if (product == null) {
          emit(SearchFailure('No products available to filter'));
          return;
        }

        final filteredProducts = product.where((product) {
          return product.name.toLowerCase().contains(event.searchTerm.toLowerCase());
        }).toList();
        if (filteredProducts == null) {
          emit(SearchFailure('null filterd prod'));
          return;
        }

        emit(SearchSuccess(filteredProducts));
      }catch(e){
        emit(SearchFailure('Failed to apply filter'));
      }
    });
  }
}