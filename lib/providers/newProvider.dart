import 'dart:js';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/model/123.dart';

import '../screens/home_screen.dart';

class newProvider with ChangeNotifier {
  Dio dio = Dio();
  List<products> prolist = [];
  String currentCategory = '';
  List<Error> registerModel = [];
  List<String> categories = [
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];
  newProvider() {
    getDataFromApi();
  }

  getDataFromApi() async {
    prolist = [];
    var respons = await dio.get('https://fakestoreapi.com/products');
    if (respons.statusCode == 200) {
      print(respons.data);
      respons.data.forEach((e) {
        prolist.add(products.fromJson(e));
      });
      notifyListeners();
    }
  }

  getDataByCategory() async {
    prolist = [];
    var respons = await dio
        .get('https://fakestoreapi.com/products/category/$currentCategory');
    if (respons.statusCode == 200) {
      print(respons.data);
      respons.data.forEach((e) {
        prolist.add(products.fromJson(e));
      });
      notifyListeners();
    }
  }

  registerFun(String name, String email, String password) async {
    var newUser = await dio.post(
        'https://retail.amit-learning.com/api/register',
        data: {'name': name, 'email': email, 'password': password});
  }

  logInFun(String email, String password) async {
    var newUser = await dio.post('https://retail.amit-learning.com/api/login',
        data: {'email': email, 'password': password});
    
        
  }
}
