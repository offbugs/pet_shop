// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pet_shop/const.dart';
import 'package:pet_shop/models/product_model.dart';
import 'package:pet_shop/style_text.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //CARD DE PRODUTOS ---------------------**********************-----------------------------------
    //PARA SERVIR DE GUIA NO INÍCIO DEIXA UM CONTAINER COM A COR AZUL.. DEPOIS TROCA POR SIZEDBOX
    return SizedBox(
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
                          decoration:
                              // ignore: prefer_const_literals_to_create_immutables
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              offset: Offset.zero,
                              color: product.color!,
                              spreadRadius: 5,
                              blurRadius: 30,
                            )
                          ]),
                        ),
                      ),
                      Image.asset(
                        'assets/foods/${product.image}',
                        height: 180,
                      ),
                    ],
                  ),
                ),
                Text(
                  product.name!,
                  style: fStyle6,
                ),
                Text(
                  '{(product.price)!.toStringAsFixed(2)}',
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
            ),
          ),
        ],
      ),
    );
    //FINALIZADO CARD DE PRODUTOS ----------------- ***************** -------------------------------------
  }
}
