// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pet_shop/const.dart';
import 'package:pet_shop/pages/cart/cart.dart';
import 'package:pet_shop/provider/cart_provider.dart';
import 'package:pet_shop/style_text.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "mop Catshop",
            style: fStyle1,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              },
              child: SizedBox(
                height: 35,
                width: 30,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: black,
                      ),
                    ),
                    cartProvider.carts.isNotEmpty
                        ? Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: deepPurple,
                              ),
                              child: Text(
                                '${cartProvider.carts.length}',
                                style: fStyle3,
                              ),
                            ))
                        : Container()
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
