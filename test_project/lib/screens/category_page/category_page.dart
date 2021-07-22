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

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _windowHeight = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Consumer<ItemProvider>(
        builder: (_, provider, __) => Column(
          children: [
            RowFilter(),
            Container(
              height: _windowHeight! * 0.9,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.5),
                  itemCount: provider.categoryItems.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: ItemCard(provider.categoryItems.elementAt(index)),
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
