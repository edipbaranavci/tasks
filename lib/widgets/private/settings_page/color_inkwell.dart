import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/config/theme_settings.dart';

class ColorInkWell extends StatelessWidget {
  const ColorInkWell({
    Key? key,
    required this.color,
    required this.onPressed,
    required this.index,
  }) : super(key: key);

  final Color color;
  final VoidCallback onPressed;
  final int index;
  @override
  Widget build(BuildContext context) {
    final control =
        index == Provider.of<ThemeSettings>(context).getColorIndex &&
            Provider.of<ThemeSettings>(context).getIsDarkMode == false;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 30,
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
          ),
        ),
        child: control ? const Icon(Icons.check) : null,
      ),
    );
  }
}
