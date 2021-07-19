import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/components/beer.dart';
import 'package:test_project/components/beer_item.dart';
import 'package:test_project/providers/beer_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of<BeerProvider>(context, listen: false).updateBeerList(),
        builder: (context, AsyncSnapshot<List<Beer>?> beerList) {
          if (beerList.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (beerList.connectionState == ConnectionState.done) {
            if (beerList.hasError) {
              return Center(
                child: Text('${beerList.error}'),
              );
            } else if (beerList.hasData) {
              return ListView.builder(
                  itemCount: beerList.data!.length,
                  itemBuilder: (context, index) {
                    return BeerItem(
                      beer: beerList.data![index],
                    );
                  });
            }
          }
          return Container();
        },
      ),
    );
  }
}
