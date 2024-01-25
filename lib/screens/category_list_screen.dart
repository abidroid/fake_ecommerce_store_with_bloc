import 'package:fake_ecommerce_store_with_bloc/blocs/category_bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            // Todo: show Spinkit
            child: CircularProgressIndicator(),
          );
        }

        if (state is CategoryErrorState) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is CategoryLoadedState) {
          // Todo: create a separate widget

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
                  return Card(
                    color: Colors.amber,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          state.categories[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
        }

        return const SizedBox.shrink();
      }),
    );
  }
}
