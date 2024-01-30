import 'package:fake_ecommerce_store_with_bloc/blocs/products_by_category_bloc/products_by_category_bloc.dart';
import 'package:fake_ecommerce_store_with_bloc/models/product_model.dart';
import 'package:fake_ecommerce_store_with_bloc/screens/all_products_screen.dart';
import 'package:fake_ecommerce_store_with_bloc/screens/product_detail_screen.dart';
import 'package:fake_ecommerce_store_with_bloc/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const AllProductsScreen();
                }));
              },
              child: const Text('View All'))
        ],
      ),
      body: BlocBuilder<ProductsByCategoryBloc, ProductsByCategoryState>(
        builder: (context, state) {
          if (state is ProductsByCategoryLoadingState) {
            return const Center(
              child: SpinKitChasingDots(
                color: Colors.amber,
              ),
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
                  mainAxisExtent: 350,
                ),
                itemBuilder: (context, index) {
                  ProductModel product = state.products[index];

                  return ProductWidget(
                    product: product,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return ProductDetailScreen(product: product);
                      }));
                    },
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
