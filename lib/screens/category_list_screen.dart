import 'package:fake_ecommerce_store_with_bloc/blocs/category_bloc/category_bloc.dart';
import 'package:fake_ecommerce_store_with_bloc/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
        if (state is CategoryLoadingState) {
          return const Center(
            child: SpinKitChasingDots(
              color: Colors.amber,
            ),
          );
        }

        if (state is CategoryErrorState) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is CategoryLoadedState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
                itemCount: state.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return CategoryWidget(category: state.categories[index]);
                }),
          );
        }

        return const SizedBox.shrink();
      }),
    );
  }
}
