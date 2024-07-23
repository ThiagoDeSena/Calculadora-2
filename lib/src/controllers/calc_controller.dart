import 'package:calculadora/src/widgets/button_hub.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalcController extends ChangeNotifier {
  var display = '0';

  void onButtonClick(ButtonClick click) {
    if (display == '0') {
      display = '';
    }

    if (click is CommonButtonClick) {
      display += click.value;
    } else if (click is ClearButtonClick) {
      display = display.substring(0, display.length - 1);
    } else if (click is ClearEntryButtonClick) {
      display = '0';
    } else if (click is EqualsButtonClick) {
      final v = display.interpret();
      display = '$v';
    } else if (click is ModuloButton) {
      double numero = double.parse(display);
      numero = -numero;
      display = numero.toString();
    } else if (click is DotButton) {
      RegExp ponto = RegExp(r"\.");
      int numeroDePontos = ponto.allMatches(display).length;
      RegExp operadores = RegExp(r"[+\-*/]");
      bool contemOperador = operadores.hasMatch(display);

      if (!display.contains('.')) {
        display += click.value;
      } else if (contemOperador && numeroDePontos < 2) {
        display += click.value;
      }
    }

    notifyListeners();
  }
}
