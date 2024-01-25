import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_store_with_bloc/models/product_model.dart';
import 'package:fake_ecommerce_store_with_bloc/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_by_category_event.dart';
part 'products_by_category_state.dart';

class ProductsByCategoryBloc extends Bloc<ProductsByCategoryEvent, ProductsByCategoryState> {
  ProductRepository productRepository = ProductRepository();

  ProductsByCategoryBloc() : super(ProductsByCategoryInitial()) {
    on<ProductsByCategoryEvent>((event, emit) async {
      if (event is LoadProductsByCategoryEvent) {
        emit(ProductsByCategoryLoadingState());

        try {
          List<ProductModel> products = await productRepository.getProductsByCategory(category: event.category);
          emit(ProductsByCategoryLoadedState(products: products));
        } catch (e) {
          emit(ProductsByCategoryErrorState(message: e.toString()));
        }
      }
    });
  }
}
