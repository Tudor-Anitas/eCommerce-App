import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/components/beer.dart';
import 'package:test_project/providers/beer_provider.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  BeerModel? _item;
  double? _windowWidth;
  double? _windowHeight;

  @override
  void initState() {
    super.initState();
    setState(() {
      _item =
          Provider.of<BeerProvider>(context, listen: false).getSelectedItem();
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
      body: Consumer<BeerProvider>(builder: (_, beerProvider, __) {
        return Container(
          width: _windowWidth!,
          padding: EdgeInsets.only(top: _windowHeight! * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _item!.brand!,
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                _item!.name!,
                style: Theme.of(context).textTheme.headline6,
              ),
              buildRowSection("Id", _item!.id!.toString()),
              buildRowSection("Style", _item!.style!),
              buildRowSection("yeast", _item!.yeast!),
            ],
          ),
        );
      }),
    );
  }

  buildRowSection(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      alignment: Alignment.centerLeft,
      // decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Row(
        children: [
          Container(
            width: _windowWidth! / 4,
            padding: EdgeInsets.only(right: 30),
            child: Text(label),
          ),
          Container(
            child: Text(value),
          )
        ],
      ),
    );
  }
}

//models
   //class1_model.dart
   //class1_model.dart

// screens
   // listing_page 
      // beer_item.dart
      // listing_page.dart

//components
  // form_components
    //custom_text_field_form
    //text_area_form
  // widget_compoments
  // slider_components
