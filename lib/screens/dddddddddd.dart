import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/newProvider.dart';
import 'package:shop_app/providers/shopProvider.dart';

class dddddddd extends StatefulWidget {
  const dddddddd({Key? key}) : super(key: key);

  @override
  State<dddddddd> createState() => _ddddddddState();
}

class _ddddddddState extends State<dddddddd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<shopProvider>(
            builder: (context, value, child) => ListView.builder(
                itemCount: value.monTaGat.length,
                itemBuilder: (context, index) => Column(
                      children: [
                        Container(child: Text('${value.monTaGat[index].id}')),
                        Image.network('${value.monTaGat[index].avatar}')
                      ],
                    ))),
      ),
    );
  }
}
