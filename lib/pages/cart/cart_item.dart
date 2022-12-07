import 'package:flutter/material.dart';
import 'package:pet_shop/const.dart';
import 'package:pet_shop/models/cart_model.dart';
import 'package:pet_shop/style_text.dart';

class CartItem extends StatelessWidget {
  final CartModel cart;
  const CartItem({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 10),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: const Offset(3, 3),
              color: black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
            )
          ]),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/foods/${cart.product!.image!}'),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product!.name!,
                  style: fStyle4,
                ),
                Text(
                  cart.product!.category!,
                  style: fStyle16,
                ),
                const SizedBox(height: 10),
                Text(
                  'R\$${(cart.product!.price!).toStringAsFixed(2)}',
                  style: fStyle4,
                ),
              ],
            ),
          ),
          Text(
            '${cart.quantity}x',
            style: fStyle15,
          ),
        ],
      ),
    );
  }
}
