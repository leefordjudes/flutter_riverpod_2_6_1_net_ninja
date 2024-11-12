import 'package:flutter/material.dart';
import 'package:flutter_riverpod_2_6_1_net_ninja/screens/cart/cart_screen.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return const CartScreen();
            // }));
            Navigator.push(context, CartScreen.route());
          },
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
            ),
          ),
        ),
      ],
    );
  }
}
