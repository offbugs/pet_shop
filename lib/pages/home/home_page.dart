// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_shop/const.dart';

import 'package:pet_shop/widgets/my_appbar.dart';
import 'package:pet_shop/style_text.dart';
import 'package:pet_shop/widgets/category.dart';
import 'package:pet_shop/widgets/my_search.dart';
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
  int selectedPage = 0;

  List<CategoryModel> dataCategory = [];
  List<ProductModel> dataProduct = [];
  List<IconData> icons = [
    Icons.home_filled,
    Icons.favorite_border_rounded,
    Icons.chat_outlined,
    Icons.person_outline_rounded
  ];

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
      body: SingleChildScrollView(
        child: Column(
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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = dataCategory[index].text!;
                        });
                      },
                      child: CategoryItem(
                        category: dataCategory[index],
                        selectedCategory: selectedCategory,
                      ),
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
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Promoções',
                    style: fStyle4,
                  ),
                  Text(
                    'Ver mais',
                    style: fStyle5,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width - 40,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 130,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: purple.withOpacity(0.5)),
                    ),
                  ),
                  Positioned(
                    top: 2,
                    left: -10,
                    child: Transform.rotate(
                      angle: -0.15,
                      child: Image.asset(
                        'assets/foods/meow-mix1.png',
                        height: 120,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 7,
                    left: 50,
                    child: Transform.rotate(
                      angle: 0.3,
                      child: Image.asset(
                        'assets/foods/authority1.png',
                        height: 120,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 20,
                    child: Transform.rotate(
                      angle: 0,
                      child: Image.asset(
                        'assets/foods/royal-canin1.png',
                        height: 120,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 190,
                    top: 30,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pacote Especial',
                          style: fStyle8,
                        ),
                        Text(
                          'Promoção \nTrês em um',
                          style: fStyle9,
                        ),
                        Text(
                          'R\$${(40.00).toStringAsFixed(2)}',
                          style: fStyle10,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: deepPurple,
          unselectedItemColor: grey,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              selectedPage = value;
            });
          },
          items: List.generate(
              icons.length,
              (index) => BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Icon(
                        icons[index],
                        color: selectedPage == index ? deepPurple : grey,
                      ),
                      const SizedBox(height: 5),
                      selectedPage == index
                          ? Container(
                              width: 18,
                              height: 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: deepPurple,
                              ),
                            )
                          : Container()
                    ],
                  ),
                  label: ''))),
    );
  }
}
