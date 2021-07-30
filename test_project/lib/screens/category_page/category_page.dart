import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/category_page/item_card.dart';
import 'package:test_project/screens/category_page/filter_row.dart';
import 'package:test_project/screens/shooping_cart/shopping_cart_page.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  //double _filterRowSize = 0.0;
  bool _displayFilters = false;

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;

    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Consumer<ItemProvider>(
          builder: (_, provider, __) => Scaffold(
            appBar: AppBar(
              title: Text('${provider.selectedCategory}'),
              actions: [
                IconButton(
                  icon: Icon(Icons.filter_list, size: 30),
                  onPressed: () {
                    setState(() {
                      _displayFilters = !_displayFilters;
                    });
                  },
                ),
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
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Theme.of(context).backgroundColor,
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
                child: Column(
                  children: [
                    AnimatedContainer(
                      height: _displayFilters ? windowHeight * 0.05 : 0,
                      duration: Duration(milliseconds: 350),
                      curve: Curves.fastOutSlowIn,
                      child: FilterRow(),
                      //child: FilterRow()
                    ),
                    Expanded(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 350),
                        curve: Curves.fastOutSlowIn,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.5),
                            itemBuilder: (_, index) => GestureDetector(
                                  onTap: () {},
                                  child: ItemCard(
                                      provider.categoryItems.elementAt(index)),
                                ),
                            itemCount: provider.categoryItems.length),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
