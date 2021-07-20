import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/components/beer.dart';
import 'package:test_project/providers/beer_provider.dart';

class DetailsPage extends StatelessWidget {
  final int index;

  DetailsPage(this.index);

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Consumer<BeerProvider>(builder: (context, beerProvider, child) {
        Beer currentBeer = beerProvider.getBeerFromList(index);

        return Container(
          width: windowWidth,
          padding: EdgeInsets.only(top: windowHeight * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                currentBeer.brand,
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                currentBeer.name,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: windowHeight * 0.1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: windowWidth * 0.45,
                    height: windowHeight * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('id'),
                        Text('style'),
                        Text('yeast'),
                        Text('malts'),
                        Text('ibu'),
                        Text('alcohol')
                      ],
                    ),
                  ),
                  Container(
                    width: windowWidth * 0.45,
                    height: windowHeight * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(currentBeer.id.toString()),
                        Text(currentBeer.style),
                        Text(currentBeer.yeast),
                        Text(currentBeer.malts),
                        Text(currentBeer.ibu),
                        Text(currentBeer.alcohol)
                      ]))
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
