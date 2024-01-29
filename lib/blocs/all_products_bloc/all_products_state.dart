part of 'all_products_bloc.dart';

sealed class AllProductsState extends Equatable {
  const AllProductsState();

  @override
  List<Object> get props => [];
}

final class AllProductsInitial extends AllProductsState {}

class AllProductsLoadingState extends AllProductsState {}

class AllProductsLoadedState extends AllProductsState {
  final List<ProductModel> products;
  const AllProductsLoadedState({required this.products});
  @override
  List<Object> get props => [products];
}

class AllProductsErrorState extends AllProductsState {
  final String message;
  const AllProductsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
