import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';

class FilterRow extends StatefulWidget {
  @override
  _FilterRowState createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  String? _colorFilter;
  String? _materialFilter;
  bool _isColorFilterActive = false;
  bool _isMaterialFilterActive = false;

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
    Border _filterBorder =
        Border.all(color: Theme.of(context).scaffoldBackgroundColor);
    return Consumer<ItemProvider>(
      builder: (_, provider, __) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('filters'),
              Container(
                width: windowWidth * 0.25,
                height: windowHeight * 0.025,
                decoration: BoxDecoration(
                    border: _isColorFilterActive ? _filterBorder : null,
                    borderRadius: BorderRadius.circular(8)),
                margin: EdgeInsets.only(left: windowWidth * 0.1),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      isDense: true,
                      iconSize: 0,
                      dropdownColor: Theme.of(context).accentColor,
                      hint: Text('color'),
                      value: _colorFilter,
                      items: provider.colorListForSelectedCategory
                          .map((color) => DropdownMenuItem(
                              child: Text(color), value: color))
                          .toList(),
                      onChanged: (String? newColor) {
                        Provider.of<ItemProvider>(context, listen: false)
                            .applyColorFilter(newColor);
                        _colorFilter = newColor;
                        _isColorFilterActive = true;
                      }),
                ),
              ),
              Container(
                  width: windowWidth * 0.25,
                  height: windowHeight * 0.025,
                  decoration: BoxDecoration(
                      border: _isMaterialFilterActive ? _filterBorder : null,
                      borderRadius: BorderRadius.circular(8)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        isDense: true,
                        iconSize: 0,
                        dropdownColor: Theme.of(context).accentColor,
                        hint: Text('material'),
                        value: _materialFilter,
                        items: provider.materialListForSelectedCategory
                            .map((material) => DropdownMenuItem(
                                child: Text(material), value: material))
                            .toList(),
                        onChanged: (String? newMaterial) {
                          Provider.of<ItemProvider>(context, listen: false)
                              .applyMaterialFilter(newMaterial);
                          _materialFilter = newMaterial;
                          _isMaterialFilterActive = true;
                        }),
                  )),
              Container(
                child: MaterialButton(
                  onPressed: () {
                    Provider.of<ItemProvider>(context, listen: false)
                        .setSelectedCategory(provider.selectedCategory);
                    _isColorFilterActive = false;
                    _isMaterialFilterActive = false;
                  },
                  child: Text(
                    'clear',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
