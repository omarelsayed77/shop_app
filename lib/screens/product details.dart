// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/newProvider.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widget/counterWidget.dart';

class ProductDetails extends StatefulWidget {
  final int index;
  const ProductDetails({Key? key, required this.index}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: NavigationBar(
        //   height: 60,
        //   destinations: [
        //     NavigationDestination(
        //         icon: Icon(Icons.home_max_outlined),
        //         selectedIcon: Icon(Icons.home),
        //         label: 'Home'),
        //     NavigationDestination(
        //         icon: Icon(Icons.category_outlined),
        //         selectedIcon: Icon(Icons.category),
        //         label: 'Category'),
        //     NavigationDestination(
        //         icon: Icon(Icons.shopping_cart_outlined),
        //         selectedIcon: Icon(Icons.shopping_cart),
        //         label: 'Cart'),
        //     NavigationDestination(
        //         icon: Icon(Icons.menu_open_outlined),
        //         selectedIcon: Icon(Icons.menu),
        //         label: 'Menu'),
        //   ],
        // ),
        body: SafeArea(
      child: Consumer<newProvider>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          height: 400,
                          child: Image.network(
                              value.prolist[widget.index].image!)),
                      Text(
                        '${value.prolist[widget.index].title}',
                        style: TextStyle(fontSize: 25),
                      ),
                      Divider(
                        thickness: 1.5,
                        color: Colors.black,
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${value.prolist[widget.index].price} EGP',
                              style: TextStyle(
                                  color: Colors.red[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            counterWidget(),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                        color: Colors.black,
                      ),
                      Text(
                        '${value.prolist[widget.index].description}',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: MaterialButton(
                      elevation: 5,
                      minWidth: 200,
                      height: 55,
                      color: Colors.red,
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => cartScreen(
                                index: widget.index,
                              ),
                            ));
                      },
                      child: Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
