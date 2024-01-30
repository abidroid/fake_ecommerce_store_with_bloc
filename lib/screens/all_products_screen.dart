import 'package:fake_ecommerce_store_with_bloc/blocs/all_products_bloc/all_products_bloc.dart';
import 'package:fake_ecommerce_store_with_bloc/models/product_model.dart';
import 'package:fake_ecommerce_store_with_bloc/screens/product_detail_screen.dart';
import 'package:fake_ecommerce_store_with_bloc/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Products')),
      body: BlocBuilder<AllProductsBloc, AllProductsState>(
        builder: (bloc, state) {
          if (state is AllProductsLoadingState) {
            return const Center(
              child: SpinKitChasingDots(
                color: Colors.amber,
              ),
            );
          }

          if (state is AllProductsErrorState) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is AllProductsLoadedState) {
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
