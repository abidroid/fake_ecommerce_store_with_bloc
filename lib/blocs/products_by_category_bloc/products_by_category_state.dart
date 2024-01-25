part of 'products_by_category_bloc.dart';

sealed class ProductsByCategoryState extends Equatable {
  const ProductsByCategoryState();

  @override
  List<Object> get props => [];
}

final class ProductsByCategoryInitial extends ProductsByCategoryState {}

class ProductsByCategoryLoadingState extends ProductsByCategoryState {}

class ProductsByCategoryLoadedState extends ProductsByCategoryState {
  final List<ProductModel> products;
  const ProductsByCategoryLoadedState({required this.products});
}

class ProductsByCategoryErrorState extends ProductsByCategoryState {
  final String message;
  const ProductsByCategoryErrorState({required this.message});
}
