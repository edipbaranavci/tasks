import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/config/theme_settings.dart';
import 'package:tasks/constants.dart';

import '../widgets/private/settings_page/color_inkwell.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _constants = SettingsPageConstants();
  final _allColors = ColorConstants().allColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(_constants.pageTitle)),
        body: Column(
          children: [
            Card(
              color: Theme.of(context).primaryColorDark,
              child: SwitchListTile(
                value: Provider.of<ThemeSettings>(context).getIsDarkMode,
                title: Text(_constants.darkModeTitle),
                onChanged: (_) =>
                    Provider.of<ThemeSettings>(context, listen: false)
                        .setThemeMode(),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                _allColors.length,
                (index) => Expanded(
                  child: ColorInkWell(
                    index: index,
                    color: _allColors[index],
                    onPressed: () => Provider.of<ThemeSettings>(
                      context,
                      listen: false,
                    ).setThemeData(index),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
