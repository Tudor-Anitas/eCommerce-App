import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/models/beer_model.dart';
import 'package:test_project/components/beer_item.dart';
import 'package:test_project/providers/beer_provider.dart';
import 'package:test_project/screens/details_page/details_page.dart';

class BeerList extends StatefulWidget {
  @override
  _BeerListState createState() => _BeerListState();
}

class _BeerListState extends State<BeerList> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Provider.of<BeerProvider>(context, listen: false)
            .updateBeerList();
        setState(() {});
      },
      child: FutureBuilder(
        future:
            Provider.of<BeerProvider>(context, listen: false).updateBeerList(),
        builder: (context, AsyncSnapshot<List<BeerModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Provider.of<BeerProvider>(context, listen: false)
                            .setSelectedItemId(snapshot.data![index].id);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage()));
                      },
                      child: BeerItem(
                        beer: snapshot.data![index],
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
