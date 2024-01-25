part of 'products_by_category_bloc.dart';

sealed class ProductsByCategoryEvent extends Equatable {
  const ProductsByCategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadProductsByCategoryEvent extends ProductsByCategoryEvent {
  final String category;
  const LoadProductsByCategoryEvent({required this.category});
}
