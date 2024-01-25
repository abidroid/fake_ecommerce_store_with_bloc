import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_store_with_bloc/repositories/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository = CategoryRepository();
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is LoadCategoriesEvent) {
        emit(CategoryLoadingState());

        try {
          List<String> categories = await categoryRepository.getAllCategories();
          emit(CategoryLoadedState(categories: categories));
        } catch (e) {
          emit(CategoryErrorState(message: e.toString()));
        }
      }
    });
  }
}
