import 'package:flutter/material.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  final String category;
  const ProductsByCategoryScreen({super.key, required this.category});

  @override
  State<ProductsByCategoryScreen> createState() => _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: const Placeholder(),
    );
  }
}
