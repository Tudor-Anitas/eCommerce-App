import 'package:flutter/material.dart';
import 'package:test_project/components/beer.dart';

class BeerItem extends StatelessWidget {
  final Beer? beer;

  BeerItem({this.beer});

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
      height: windowHeight * 0.15,
      margin: EdgeInsets.symmetric(
          horizontal: windowWidth * 0.07, vertical: windowHeight * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: windowWidth * 0.075, vertical: windowHeight * 0.02),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [BoxShadow(offset: Offset(2, 2), blurRadius: 4.0)],
          gradient: LinearGradient(
            colors: [
              Theme.of(context).accentColor,
              Theme.of(context).hintColor
            ],
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            beer!.brand,
            style: Theme.of(context).textTheme.headline5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: windowWidth * 0.4,
                  child: Text(
                    beer!.name,
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
              Text(
                beer!.alcohol,
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          )
        ],
      ),
    );
  }
}
