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

// TODO rename the class
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
        builder: (context, AsyncSnapshot<List<BeerModel>?> snapshot) {
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
