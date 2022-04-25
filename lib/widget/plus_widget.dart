// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class plusWidget extends StatefulWidget {
  plusWidget({Key? key, required this.prisepro}) : super(key: key);
  String prisepro;

  @override
  State<plusWidget> createState() => _plusWidgetState();
}

class _plusWidgetState extends State<plusWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Icon(
                Icons.plus_one,
                color: Colors.white,
              )),
          Text(
            '${widget.prisepro} EGP',
            style:
                TextStyle(color: Colors.red[400], fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
