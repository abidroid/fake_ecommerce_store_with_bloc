import 'package:fake_ecommerce_store_with_bloc/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Image.network(
            widget.product.image!,
            height: 200,
            width: MediaQuery.sizeOf(context).width * 0.7,
            fit: BoxFit.fill,
          ),
          const Gap(8),
          Text(
            widget.product.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(8),
          Text(
            'Rs. ${widget.product.price}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(8),
          Text(
            '${widget.product.rating!.count} Sold',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star),
              const Gap(4),
              Text(
                '${widget.product.rating!.rate!}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const Gap(8),
          Text(
            widget.product.description!,
          ),
        ]),
      ),
    );
  }
}
