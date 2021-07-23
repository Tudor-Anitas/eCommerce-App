import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/category_page/item_card.dart';
import 'package:test_project/screens/category_page/row_filter.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  double? _windowHeight;
  double? _windowWidth;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _windowHeight = MediaQuery.of(context).size.height;
    _windowWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'category_background.jpg',
        width: _windowWidth,
        height: _windowHeight,
        fit: BoxFit.cover,
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Consumer<ItemProvider>(
                builder: (_, provider, __) => Column(
                  children: [
                    RowFilter(),
                    Container(
                      width: _windowWidth,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(provider.selectedCategory!,
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    Container(
                      height: _windowHeight! * 0.8,
                      child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.5),
                          itemCount: provider.categoryItems.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: ItemCard(
                                  provider.categoryItems.elementAt(index)),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            )),
      ),
    ]);
  }
}
