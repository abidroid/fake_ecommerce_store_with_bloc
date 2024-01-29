part of 'all_products_bloc.dart';

sealed class AllProductsEvent extends Equatable {
  const AllProductsEvent();

  @override
  List<Object> get props => [];
}

class LoadAllProductsEvent extends AllProductsEvent{}