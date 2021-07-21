import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/theme.dart';

class ThemeSwitch extends StatefulWidget {
  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  bool _isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Switch(
          onChanged: (value) {
            Provider.of<CustomTheme>(context, listen: false).toggleTheme();
            setState(() {
              _isDarkMode = !_isDarkMode;
            });
          },
          value: _isDarkMode,
          activeColor: Theme.of(context).toggleableActiveColor,
        )
      ],
    );
  }
}
