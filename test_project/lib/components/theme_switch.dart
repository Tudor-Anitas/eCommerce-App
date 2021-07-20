import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/theme.dart';

class ThemeSwitch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.light,
                color: Colors.grey,
              ),
              onPressed: () {
                Provider.of<CustomTheme>(context, listen: false).toggleTheme();
              },
            ),
            SizedBox(width: windowWidth * 0.05)
          ],
        );
  }
}