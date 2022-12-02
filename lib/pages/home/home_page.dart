import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_shop/const.dart';

import 'package:pet_shop/widgets/my_appbar.dart';
import 'package:pet_shop/style_text.dart';
import 'package:pet_shop/widgets/category.dart';
import 'package:pet_shop/widgets/my_search.dart';
import 'package:pet_shop/widgets/product.dart';
import 'package:pet_shop/widgets/special.dart';

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
          children: [
            const SizedBox(height: 50),
            const MyAppBar(),
            const SizedBox(height: 30),
            const MySearch(),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  dataCategory.length,
                  (index) => Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 20, right: 20)
                        : const EdgeInsets.only(right: 20),
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
            const SpecialOfer()
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
