// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/newProvider.dart';
import 'package:shop_app/screens/product%20details.dart';
import 'package:shop_app/widget/plus_widget.dart';

class allProductScreen extends StatefulWidget {
  const allProductScreen({Key? key}) : super(key: key);

  @override
  State<allProductScreen> createState() => _allProductScreenState();
}

class _allProductScreenState extends State<allProductScreen> {
  Color categoryColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<newProvider>(
        builder: (context, value, child) => SingleChildScrollView(
          child: Column(
            children: [
              Consumer<newProvider>(
                builder: (context, value, child) => Container(
                  // width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'images/202.png',
                            width: MediaQuery.of(context).size.width,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    value.getDataFromApi();
                                    categoryColor = Colors.grey;
                                  },
                                  child: Chip(
                                    backgroundColor: Colors.grey,

                                    // (value.currentCategory ==
                                    //         value.categories)
                                    //     ? Colors.blue
                                    //     : Colors.grey,
                                    label: Text(
                                      'All',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                for (int i = 0;
                                    i < value.categories.length;
                                    i++)
                                  Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        value.currentCategory =
                                            value.categories[i];
                                        value.getDataByCategory();
                                      },
                                      child: Chip(
                                        backgroundColor:
                                            (value.currentCategory ==
                                                    value.categories[i])
                                                ? categoryColor
                                                : Colors.grey,
                                        label: Text(
                                          '${value.categories[i]}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.grey[300],
                child: GridView.builder(
                  itemCount: value.prolist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.75),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                    index: index,
                                  )));
                    },
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  // width: 200,
                                  // height: 500,
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.all(5),
                                  // color: Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          child: Image.network(
                                              '${value.prolist[index].image}')),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${value.prolist[index].title}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text((value.prolist[index]
                                                      .description!.length >
                                                  20)
                                              ? '${value.prolist[index].description!.substring(0, 30)}...'
                                              : '${value.prolist[index].description}'),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          plusWidget(
                                              prisepro:
                                                  '${value.prolist[index].price}'),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
