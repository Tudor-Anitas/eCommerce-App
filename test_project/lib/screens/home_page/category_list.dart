import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/screens/category_page/category_page.dart';
import 'package:test_project/screens/home_page/category_card.dart';
import 'package:test_project/providers/item_provider.dart';
class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Provider.of<ItemProvider>(context, listen: false)
            .updateCategoryList();
        setState(() {});
      },
      child: FutureBuilder(
        future: Provider.of<ItemProvider>(context, listen: false)
            .updateCategoryList(),
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Provider.of<ItemProvider>(context, listen: false)
                          .setSelectedCategory(snapshot.data![index]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryPage()));
                    },
                    child: CategoryCard(
                      categoryName: snapshot.data![index],
                    ),
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    ),
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
