import 'package:fake_ecommerce_store_with_bloc/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
    required this.onTap,
  });

  final ProductModel product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.network(
              product.image!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const Gap(8),
            Text(
              product.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(8),
            Text(
              'Rs. ${product.price}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(8),
            Text(
              '${product.rating!.count} Sold',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(8),
            Row(
              children: [
                const Icon(Icons.star),
                const Gap(4),
                Text(
                  '${product.rating!.rate!}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
