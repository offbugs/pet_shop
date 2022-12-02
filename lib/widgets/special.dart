import 'package:flutter/material.dart';
import 'package:pet_shop/const.dart';
import 'package:pet_shop/style_text.dart';

class SpecialOfer extends StatelessWidget {
  const SpecialOfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
