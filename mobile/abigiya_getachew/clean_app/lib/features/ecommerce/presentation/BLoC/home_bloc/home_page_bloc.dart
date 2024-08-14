import 'package:clean_app/core/error/failure.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_event.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_state.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/domain/usecases/get_all_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent,HomePageState>{
  GetAllProducts getAllProducts;
  HomePageBloc({required this.getAllProducts}):super(FetchLoading()){
    on<FetchData>((event, emit) async{
    emit(FetchLoading() );
    try{
      final result= await  getAllProducts();
      result.fold(
        (failure)=>emit(FetchFailure(failure.message)),
        (products)=>emit(FetchSuccess(products)),
      );

    }catch(e){
      emit(FetchFailure("Failed to fetch data"));
    }
    }
    );
    }
  }