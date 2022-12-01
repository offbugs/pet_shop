// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_shop/const.dart';
import 'package:pet_shop/pages/home/components/my_appbar.dart';
import 'package:pet_shop/style_text.dart';
import 'package:pet_shop/widgets/category.dart';
import 'package:pet_shop/pages/home/components/my_search.dart';

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

  @override
  void initState() {
    getCategory();
    super.initState();
  }

  @override
  void dispose() {
    getCategory();
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

          //PARA SERVIR DE GUIA NO INÍCIO DEIXA UM CONTAINER COM A COR AZUL.. DEPOIS TROCA POR SIZEDBOX
          SizedBox(
            //color: blue,
            height: MediaQuery.of(context).size.height * 0.3 + 60,
            width: MediaQuery.of(context).size.width * 0.5 - 30,
            child: Stack(
              children: [
                Positioned(
                  top: 30,
                  left: 10,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3 + 10,
                    width: MediaQuery.of(context).size.width * 0.5 - 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3, 3),
                            color: black.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 5,
                          )
                        ]),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 50,
                              left: 20,
                              right: 20,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset.zero,
                                        color: orange,
                                        spreadRadius: 5,
                                        blurRadius: 30,
                                      )
                                    ]),
                              ),
                            ),
                            Image.asset(
                              'assets/foods/meow-mix1.png',
                              height: 180,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Meow Mix',
                        style: fStyle6,
                      ),
                      Text(
                        'R\$${14.00}',
                        style: fStyle4,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: green,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '+',
                          style: fStyle7,
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
