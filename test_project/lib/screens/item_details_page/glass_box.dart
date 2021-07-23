import 'package:flutter/material.dart';

class GlassBox extends StatelessWidget {
  final String label;
  final String value;

  GlassBox({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
      width: windowWidth * 0.25,
      height: windowHeight * 0.155,
      margin: EdgeInsets.symmetric(
          vertical: windowHeight * 0.015, horizontal: windowWidth * 0.03),
      child: Column(
        children: [
          Container(
            height: windowHeight * 0.12,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.5,
                  color: Theme.of(context).cardColor.withOpacity(0.2),
                )),
            child: Center(child: Text('$value')),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Text('$label'),
          )
        ],
      ),
    );
  }
}
