import 'dart:convert';

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

        return categories;
      } else {
        throw Exception('Not Found');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
