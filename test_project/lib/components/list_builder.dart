import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/components/beer.dart';
import 'package:test_project/components/beer_item.dart';
import 'package:test_project/components/refresh_list.dart';
import 'package:test_project/providers/beer_provider.dart';
import 'package:test_project/screens/details_page.dart';

class ListBuilder extends StatefulWidget {
  @override
  _ListBuilderState createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    return RefreshList(
      onRefresh: () async {
        await Provider.of<BeerProvider>(context, listen: false)
            .updateBeerList();
        setState(() {});
      },
      child: FutureBuilder(
        future:
            Provider.of<BeerProvider>(context, listen: false).updateBeerList(),
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
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(index))),
                      child: BeerItem(
                        beer: beerList.data![index],
                      ),
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
