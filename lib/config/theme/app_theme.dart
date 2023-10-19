import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(156, 189, 4, 4);

const List<Color> colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int selectedColor;

  const AppTheme({required this.selectedColor}) 
  : assert(selectedColor >= 0 && selectedColor <= colorThemes.length-1,'Colores solo entre 0 y ${colorThemes.length-1}');

  ThemeData theme() {
    return ThemeData(useMaterial3: true, colorSchemeSeed: colorThemes[selectedColor]);
  }
}
