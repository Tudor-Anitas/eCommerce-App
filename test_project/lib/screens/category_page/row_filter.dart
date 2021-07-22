import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';

class RowFilter extends StatefulWidget {
  @override
  _RowFilterState createState() => _RowFilterState();
}

class _RowFilterState extends State<RowFilter> {
  String? _colorFilter;
  String? _materialFilter;

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
    return Consumer<ItemProvider>(
      builder: (_, provider, __) {
        return Container(
          height: windowHeight * 0.05,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('filters'),
              Container(
                  width: windowWidth * 0.25,
                  height: windowHeight * 0.025,
                  margin: EdgeInsets.only(left: windowWidth * 0.1),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isDense: true,
                      dropdownColor: Theme.of(context).accentColor,
                      hint: Text('color'),
                      value: _colorFilter,
                      items: provider.colorListForSelectedCategory
                          .map((color) => DropdownMenuItem(
                              child: Text(color), value: color))
                          .toList(),
                      onChanged: (String? newColor) => setState(() {
                        Provider.of<ItemProvider>(context, listen: false)
                            .applyColorFilter(newColor);
                        _colorFilter = newColor;
                      }),
                    ),
                  )),
              Container(
                  width: windowWidth * 0.25,
                  height: windowHeight * 0.025,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isDense: true,
                      dropdownColor: Theme.of(context).accentColor,
                      hint: Text('material'),
                      value: _materialFilter,
                      items: provider.materialListForSelectedCategory
                          .map((material) => DropdownMenuItem(
                              child: Text(material), value: material))
                          .toList(),
                      onChanged: (String? newMaterial) => setState(() {
                        Provider.of<ItemProvider>(context, listen: false)
                            .applyMaterialFilter(newMaterial);
                        _materialFilter = newMaterial;
                      }),
                    ),
                  )),
              Container(
                child: MaterialButton(
                  onPressed: () {
                    Provider.of<ItemProvider>(context, listen: false)
                        .setSelectedCategory(provider.selectedCategory);
                  },
                  child: Text('clear', style: Theme.of(context).textTheme.bodyText2,),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
