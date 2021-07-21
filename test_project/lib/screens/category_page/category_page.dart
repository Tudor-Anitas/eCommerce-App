import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/models/item_model.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/category_page/item_card.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<ItemModel>? _categoryItems;
  double? _windowWidth;
  double? _windowHeight;

  @override
  void initState() {
    super.initState();
    setState(() {
      _categoryItems =
          Provider.of<ItemProvider>(context, listen: false).getCategoryItems();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _windowWidth = MediaQuery.of(context).size.width;
    _windowHeight = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.5),
          itemCount: _categoryItems!.length,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {},
              child: ItemCard(_categoryItems!.elementAt(index)),
            );
          }),
    )
        // return Container(
        //   width: _windowWidth!,
        //   padding: EdgeInsets.only(top: _windowHeight! * 0.1),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Text(
        //         _item!.brand!,
        //         style: Theme.of(context).textTheme.headline3,
        //       ),
        //       Container(
        //         margin: EdgeInsets.only(bottom: _windowHeight! * 0.1),
        //         decoration: BoxDecoration(
        //             border: Border(
        //                 bottom: BorderSide(
        //                     color: Theme.of(context).accentColor, width: 5))),
        //         child: Text(
        //           _item!.name!,
        //           style: Theme.of(context).textTheme.headline6,
        //         ),
        //       ),
        //       buildRowSection("Id", _item!.id!.toString()),
        //       buildRowSection("Style", _item!.style!),
        //       buildRowSection("Yeast", _item!.yeast!),
        //       buildRowSection('Malts', _item!.malts!),
        //       buildRowSection('Ibu', _item!.ibu!),
        //       buildRowSection('Alcohol', _item!.alcohol!),
        //     ],
        //   ),
        // );
        );
  }

  // buildRowSection(String label, String value) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: _windowWidth! * 0.2),
  //     margin: EdgeInsets.only(bottom: _windowHeight! * 0.01),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Container(
  //           alignment: Alignment.centerRight,
  //           width: _windowWidth! * 0.25,
  //           child: Text(
  //             label,
  //             textAlign: TextAlign.end,
  //           ),
  //         ),
  //         Container(
  //           width: _windowWidth! * 0.25,
  //           child: Text(value),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
