import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/newProvider.dart';
import 'package:shop_app/providers/shopProvider.dart';
import 'package:shop_app/screens/dddddddddd.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/screens/login_screen.dart';
import 'package:shop_app/screens/product%20details.dart';
import 'package:shop_app/screens/register.dart';
import 'package:shop_app/widget/counterWidget.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => shopProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => newProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: register()),
    );
  }
}
