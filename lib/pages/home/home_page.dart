// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_shop/pages/home/components/my_appbar.dart';
import 'package:pet_shop/style_text.dart';
import 'package:pet_shop/widgets/category.dart';
import 'package:pet_shop/pages/home/components/my_search.dart';
import 'package:pet_shop/widgets/product.dart';

import '../../models/category_model.dart';
import '../../models/product_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'Foods';
  List<CategoryModel> dataCategory = [];
  List<ProductModel> dataProduct = [];

  Future<void> getCategory() async {
    final String response =
        await rootBundle.loadString('assets/json/category.json');

    final data = json.decode(response);
    setState(() {
      for (var element in data['category']) {
        dataCategory.add(CategoryModel.fromJson(element));
      }
    });
  }

  Future<void> getProduct() async {
    final String response =
        await rootBundle.loadString('assets/json/product.json');

    final data = json.decode(response);
    setState(() {
      for (var element in data['product']) {
        dataProduct.add(ProductModel.fromJson(element));
      }
    });
  }

  @override
  void initState() {
    getCategory();
    getProduct();
    super.initState();
  }

  @override
  void dispose() {
    getCategory();
    getProduct();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(height: 50),
          MyAppBar(),
          const SizedBox(height: 30),
          MySearch(),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                dataCategory.length,
                (index) => Padding(
                  padding: index == 0
                      ? EdgeInsets.only(left: 20, right: 20)
                      : EdgeInsets.only(right: 20),
                  child: CategoryItem(
                    category: dataCategory[index],
                    selectedCategory: selectedCategory,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mais vendidos',
                  style: fStyle4,
                ),
                Text(
                  'Ver mais',
                  style: fStyle5,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  dataProduct.length,
                  (index) => Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(left: 20, right: 20)
                            : const EdgeInsets.only(right: 20),
                        child: ProductItem(
                          product: dataProduct[index],
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
