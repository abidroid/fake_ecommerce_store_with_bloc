import 'package:fake_ecommerce_store_with_bloc/blocs/all_products_bloc/all_products_bloc.dart';
import 'package:fake_ecommerce_store_with_bloc/blocs/category_bloc/category_bloc.dart';
import 'package:fake_ecommerce_store_with_bloc/blocs/products_by_category_bloc/products_by_category_bloc.dart';
import 'package:fake_ecommerce_store_with_bloc/screens/category_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryBloc()..add(LoadCategoriesEvent())),
        BlocProvider(create: (context) => ProductsByCategoryBloc()),
        BlocProvider(create: (context) => AllProductsBloc()..add(LoadAllProductsEvent()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CategoryListScreen(),
      ),
    );
  }
}
