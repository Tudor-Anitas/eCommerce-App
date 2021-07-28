import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:test_project/screens/category_page/category_page.dart';
import 'package:test_project/screens/home_page/category_card.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/shooping_cart/shopping_cart_page.dart';

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
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    pinned: false,
                    title: Text('Categories'),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.shopping_bag, size: 30),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  curve: Curves.easeInOutQuart,
                                  child: ShoppingCartPage()));
                        },
                      )
                    ],
                  ),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate((_, index) {
                      return GestureDetector(
                        onTap: () {
                          Provider.of<ItemProvider>(context, listen: false)
                              .setSelectedCategory(snapshot.data![index]);
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: CategoryPage(),
                                  type: PageTransitionType.fade));
                        },
                        child: CategoryCard(
                          categoryName: snapshot.data![index],
                        ),
                      );
                    }, childCount: snapshot.data!.length),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, crossAxisSpacing: 10, childAspectRatio: 1/1.15),
                  ),

                  //
                ],
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
