// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pet_shop/const.dart';
import 'package:pet_shop/style_text.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "mop Petshop",
            style: fStyle1,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            color: black,
          )
        ],
      ),
    );
  }
}
