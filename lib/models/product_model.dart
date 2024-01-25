class ProductModel {
  int? id;
  String? title;
  int? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductModel({this.id, this.title, this.price, this.description, this.category, this.image, this.rating});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['count'] = this.count;
    return data;
  }
}


/*
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

class ProductsByCategoryErrorState extends ProductsByCategoryState {}

*/