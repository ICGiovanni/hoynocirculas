import 'package:flutter/material.dart';

enum Estado {
  ok,
  warning,
  danger,
}

Text widgetText(Estado valor) {
  late Color color;
  late String text;

  if (valor.index == 0) {
    text = 'Verificado';
    color = Colors.green;
  } else if (valor.index == 1) {
    text = 'Por Verificar';
    color = Colors.yellow;
  } else if (valor.index == 2) {
    text = 'No verificado';
    color = Colors.red;
  }

  return Text(text,
      style: TextStyle(
        color: color,
      ));
}

Icon widgetIcon(Estado valor, double size) {
  late Color color;
  late IconData icon;

  if (valor.index == 0) {
    icon = Icons.check_circle;
    color = Colors.green;
  } else if (valor.index == 1) {
    icon = Icons.warning;
    color = Colors.yellow;
  } else if (valor.index == 2) {
    icon = Icons.warning;
    color = Colors.red;
  }

  return Icon(
    icon,
    color: color,
    size: size,
  );
}

Color? widgetBackground(Estado valor) {
  return valor.index == 0 || valor.index == 1 ? Colors.grey[300] : Colors.red;
}

Color? widgetTextColor(Estado valor) {
  return valor.index == 0 || valor.index == 1 ? Colors.grey[600] : Colors.white;
}
