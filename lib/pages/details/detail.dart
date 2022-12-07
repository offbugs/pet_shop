import 'package:flutter/material.dart';
import 'package:pet_shop/const.dart';
import 'package:pet_shop/models/product_model.dart';
import 'package:pet_shop/provider/cart_provider.dart';
import 'package:pet_shop/style_text.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  final ProductModel product;
  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //QUANTIDADE DEFAULT NA TELA DE DETALHES
  int quantity = 0;

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
          'Detalhes',
          style: fStyle4,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5 - 10,
            child: Stack(
              children: [
                //COR DO FUNDO REDONDO ........................................
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.12,
                  right: MediaQuery.of(context).size.width * 0.2,
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: widget.product.color!,
                          offset: Offset.zero,
                          blurRadius: 100,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                  ),
                ),
                //IMAGEM........................................................
                Image.asset('assets/foods/${widget.product.image}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name!,
                  style: fStyle4,
                ),
                const SizedBox(height: 20),
                Text(
                  widget.product.description!,
                  maxLines: 4,
                  style: fStyle11,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: const Icon(Icons.add, color: grey)),
                          const SizedBox(width: 20),
                          Text(
                            '$quantity',
                            style: poppin,
                          ),
                          const SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                //A COMD IMPEDE QUE O VALOR FIQUE NEGATIVO CASO A QUANTIDADE ESTEJA ZERADA **************************
                                //SÓ DEIXA DIMINUIR SE FOR MAIOR QUE 0
                                if (quantity > 0) {
                                  quantity--;
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              color: grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'R\$${(quantity * widget.product.price!).toStringAsFixed(2)}',
                      style: fStyle12,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: white,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Icon(
              Icons.favorite_outline,
              size: 32,
              color: grey,
            ),
            const SizedBox(width: 25),
            GestureDetector(
              onTap: () {
                cartProvider.addCart(widget.product, quantity);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                decoration: BoxDecoration(
                    color: deepPurple, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.shopping_cart_outlined,
                        color: white,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Adicionar ao carrinho',
                        style: fStyle13,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
