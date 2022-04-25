// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/newProvider.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/widget/counterWidget.dart';

class cartScreen extends StatefulWidget {
  cartScreen({this.index});
  int? index = 1;
  @override
  State<cartScreen> createState() => _categoriesScreenState();
}

class _categoriesScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<newProvider>(
            builder: (context, value, child) => Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(2),
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 150,
                                      height: 100,
                                      child: Expanded(
                                          child: Image.network(
                                              '${value.prolist[widget.index!].image}')),
                                    ),
                                    SizedBox(
                                      width: 40,
                                    ),
                                    Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 200,
                                          child: Expanded(
                                            child: Text(
                                              '${value.prolist[widget.index!].title}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Text((value.prolist[widget.index!]
                                                    .description!.length >
                                                20)
                                            ? '${value.prolist[widget.index!].description!.substring(0, 30)}...'
                                            : '${value.prolist[widget.index!].description}'),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${value.prolist[widget.index!].price} EGP',
                                              style: TextStyle(
                                                  color: Colors.red[400],
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                            SizedBox(
                                              width: 60,
                                            ),
                                            counterWidget(),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Divider(
                              indent: 10,
                              endIndent: 10,
                              thickness: 1.5,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 50,
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
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => homeScreen(),
                                        ));
                                  },
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
                )),
      ),
    );
  }
}
