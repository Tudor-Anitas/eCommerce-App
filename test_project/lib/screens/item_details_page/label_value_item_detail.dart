import 'package:flutter/material.dart';

class LabelValueItemDetail extends StatelessWidget {
  final String label;
  final String value;

  LabelValueItemDetail({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: windowHeight * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              alignment: Alignment.center,
              width: windowWidth * 0.3,
              child: Text('$label', textAlign: TextAlign.center,)),
          Container(
              alignment: Alignment.center,
              width: windowWidth * 0.3,
              child: Text('$value', textAlign: TextAlign.center,))
        ],
      ),
    );
  }
}
