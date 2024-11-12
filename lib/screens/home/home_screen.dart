import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_2_6_1_net_ninja/providers/providers.dart';
import 'package:flutter_riverpod_2_6_1_net_ninja/shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final item = allProducts[index];
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                  Image.asset(item.image, width: 60, height: 60),
                  Text(item.title),
                  Text('£${item.price}'),
                  if (cartProducts.contains(item))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .removeProduct(item);
                      },
                      child: const Text('Remove'),
                    ),
                  if (!cartProducts.contains(item))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .addProduct(item);
                      },
                      child: const Text('Add to Cart'),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
