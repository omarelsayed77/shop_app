// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class counterWidget extends StatefulWidget {
  counterWidget({
    Key? key,
  }) : super(key: key);

  int counter = 1;
  @override
  State<counterWidget> createState() => _counterWidgetState();
}

class _counterWidgetState extends State<counterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 32,
            child: OutlineButton(
              highlightedBorderColor: Colors.red,
              onPressed: () {
                if (widget.counter > 1)
                  setState(() {
                    widget.counter--;
                  });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
              child: Icon(Icons.remove),
            ),
          ),
          Container(
            width: 50,
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey)),
            child: Text(
              '${widget.counter}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red[400], fontSize: 18),
            ),
          ),
          SizedBox(
            width: 40,
            height: 32,
            child: OutlineButton(
              color: Colors.red,
              onPressed: () {
                setState(() {
                  widget.counter++;
                });
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
