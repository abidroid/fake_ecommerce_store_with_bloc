import 'package:fake_ecommerce_store_with_bloc/blocs/products_by_category_bloc/products_by_category_bloc.dart';
import 'package:fake_ecommerce_store_with_bloc/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  final String category;
  const ProductsByCategoryScreen({super.key, required this.category});

  @override
  State<ProductsByCategoryScreen> createState() => _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsByCategoryBloc>().add(LoadProductsByCategoryEvent(category: widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocBuilder<ProductsByCategoryBloc, ProductsByCategoryState>(
        builder: (context, state) {
          if (state is ProductsByCategoryLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ProductsByCategoryErrorState) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is ProductsByCategoryLoadedState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  ProductModel product = state.products[index];

                  return Card(
                    child: Column(children: [Image.network(product.image!)]),
                  );
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
