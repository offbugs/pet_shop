import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pet_shop/const.dart';

import 'package:pet_shop/pages/cart/cart_item.dart';
import 'package:pet_shop/provider/cart_provider.dart';
import 'package:pet_shop/style_text.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: black.withOpacity(0.7),
            size: 18,
          ),
        ),
        title: Text(
          'Meu Carrinho',
          style: fStyle4,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: '${cartProvider.carts.length}',
                style: fStyle6,
              ),
              TextSpan(
                text: cartProvider.carts.length > 1 ? ' Itens ' : ' Item ',
                style: fStyle6,
              ),
            ])),
          ),

          //CARD ***************************************************************
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  children: List.generate(
                      cartProvider.carts.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Container(
                              height: 105,
                              decoration: BoxDecoration(
                                  color: grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Slidable(
                                  endActionPane: ActionPane(
                                      extentRatio: 0.15,
                                      motion: const BehindMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (context) {
                                            cartProvider.removeCart(
                                                cartProvider.carts[index].id!);
                                          },
                                          icon: Icons.delete_outline_rounded,
                                          foregroundColor: Colors.red,
                                          autoClose: true,
                                          backgroundColor:
                                              grey.withOpacity(0.2),
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  right: Radius.circular(20)),
                                        )
                                      ]),
                                  child: CartItem(
                                      cart: cartProvider.carts[index])),
                            ),
                          ))),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(seconds: 2),
        height: cartProvider.carts.isNotEmpty ? 265 : 0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.2),
              offset: Offset.zero,
              spreadRadius: 5,
              blurRadius: 10,
            )
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: '${cartProvider.carts.length}',
                        style: fStyle6,
                      ),
                      TextSpan(
                        text: cartProvider.carts.length > 1
                            ? ' Itens '
                            : ' Item ',
                        style: fStyle6,
                      )
                    ])),
                    Text(
                      'R\$${(cartProvider.totalPrice()).toStringAsFixed(2)}',
                      style: fStyle6,
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax',
                      style: fStyle6,
                    ),
                    Text(
                      'R\$${(cartProvider.totalPrice() * 0.1).toStringAsFixed(2)}',
                      style: fStyle6,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: fStyle4,
                    ),
                    Text(
                      'R\$${(cartProvider.totalPrice() * 1.1).toStringAsFixed(2)}',
                      style: fStyle4,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: deepPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Concluir',
                      style: fStyle13,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
