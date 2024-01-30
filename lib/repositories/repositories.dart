import 'dart:convert';

import 'package:fake_ecommerce_store_with_bloc/models/product_model.dart';
import 'package:fake_ecommerce_store_with_bloc/utility/constants.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  Future<List<String>> getAllCategories() async {
    try {
      http.Response response = await http.get(Uri.parse(getAllCategoriesUrl));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        List<String> categories = [];

        for (var jsonCategory in jsonResponse) {
          categories.add(jsonCategory.toString());
        }

        //print(categories);
        return categories;
      } else {
        throw Exception('Not Found');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

class ProductRepository {
  Future<List<ProductModel>> getProductsByCategory({required String category}) async {
    try {
      http.Response response = await http.get(Uri.parse('$getProductsByCategoryUrl$category'));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        List<ProductModel> products = [];
        for (var jsonProduct in jsonResponse) {
          ProductModel productModel = ProductModel.fromJson(jsonProduct);
          products.add(productModel);
        }
        return products;
      } else {
        throw Exception('Not Found');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

class AllProductsRepository {
  Future<List<ProductModel>> getAllProducts() async {
    try {
      http.Response response = await http.get(Uri.parse(getAllProductUrl));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        List<ProductModel> products = [];
        for (var jsonProduct in jsonResponse) {
          ProductModel productModel = ProductModel.fromJson(jsonProduct);
          products.add(productModel);
        }
        return products;
      } else {
        throw Exception('Not Found');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
