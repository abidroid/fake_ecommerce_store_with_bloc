import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_store_with_bloc/models/product_model.dart';
import 'package:fake_ecommerce_store_with_bloc/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_products_event.dart';
part 'all_products_state.dart';

class AllProductsBloc extends Bloc<AllProductsEvent, AllProductsState> {
  AllProductsRepository allProductsRepository = AllProductsRepository();

  AllProductsBloc() : super(AllProductsInitial()) {
    on<LoadAllProductsEvent>((event, emit) async {
      emit(AllProductsLoadingState());

      try {
        final products = await allProductsRepository.getAllProducts();
        emit(AllProductsLoadedState(products: products));
      } catch (e) {
        emit(AllProductsErrorState(message: e.toString()));
      }
    });
  }
}
