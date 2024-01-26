import 'package:fake_ecommerce_store_with_bloc/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Image.network(
                product.image!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                  right: 10,
                  top: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    ),
                  ))
            ],
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
    );
  }
}
