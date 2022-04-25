// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/newProvider.dart';
import 'package:shop_app/screens/allProductScreen.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/product%20details.dart';
import 'package:shop_app/widget/plus_widget.dart';

class homeScreen extends StatefulWidget {
  homeScreen({Key? key}) : super(key: key);
  int? indddddd = 0;
  final pagessssssss = [
    Center(
      child: allProductScreen(),
    ),
    Center(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Your Cart Is Empty',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Positioned(
                    // left: 10,
                    // right: 10,
                    bottom: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          child: MaterialButton(
                            // elevation: 5,
                            minWidth: 210,
                            height: 50,
                            color: Colors.white,
                            onPressed: () {},
                            child: Text(
                              'Clear Cart',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          child: MaterialButton(
                            // elevation: 5,
                            minWidth: 210,
                            height: 50,
                            color: Colors.red[500],
                            onPressed: () {},
                            child: Text(
                              'Go to checkout',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    ),
    Center(
      child: Scaffold(),
    ),
  ];
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        bottomNavigationBar: NavigationBar(
          selectedIndex: pageIndex,
          onDestinationSelected: (pageIndex) {
            setState(() {
              this.pageIndex = pageIndex;
            });
          },
          height: 60,
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.holiday_village_outlined),
                selectedIcon: Icon(Icons.holiday_village_sharp),
                label: 'Home'),
            // NavigationDestination(
            //     icon: Icon(Icons.category_outlined),
            //     selectedIcon: Icon(Icons.category),
            //     label: 'Category'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                selectedIcon: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
                label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.menu_open_outlined),
                selectedIcon: Icon(Icons.menu),
                label: 'Menu'),
          ],
        ),
        body: widget.pagessssssss[pageIndex]);
  }
}
