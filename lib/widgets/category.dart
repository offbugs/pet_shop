// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:pet_shop/const.dart';
import 'package:pet_shop/models/category_model.dart';
import 'package:pet_shop/style_text.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final String selectedCategory;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 20, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: deepPurple,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: white,
            ),
            child: Image.asset(
              'assets/category/${category.image!}',
              height: 20,
            ),
          ),
          SizedBox(width: 10),
          Text(
            category.text!,
            style: fStyle3,
          )
        ],
      ),
    );
  }
}
