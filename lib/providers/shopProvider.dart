// ignore_for_file: camel_case_types

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/model/2222222.dart';

class shopProvider with ChangeNotifier {
  Dio dio = Dio();
  List<Products> monTaGat = [];
  shopProvider() {
    getAllProducts();
  }
  getAllProducts() async {
    try {
      var responsr =
          await dio.get('https://retail.amit-learning.com/api/products');
      if (responsr.statusCode == 200) {
        print(responsr.data['products']);
        responsr.data['products'].forEach((e) {
          monTaGat.add(Products.fromJson(e));
        });
        notifyListeners();
      }
    } catch (e) {
      print('eroooooooooooooooooooor');
    }
    notifyListeners();
  }
}
