// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pet_shop/const.dart';
import 'package:pet_shop/style_text.dart';

class MySearch extends StatelessWidget {
  const MySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: grey.withOpacity(0.2),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Digite sua busca aqui',
            hintStyle: fStyle2,
            prefixIcon: Icon(Icons.search),
            prefixIconColor: deepPurple,
          ),
        ),
      ),
    );
  }
}
