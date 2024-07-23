import 'package:calculadora/src/widgets/button_hub.dart';
import 'package:calculadora/src/widgets/display.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/src/controllers/calc_controller.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  final controller = CalcController();

  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_listener);
  }

  @override
  void dispose() {
    controller.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: Display(value: controller.display),
            flex: 1,
          ),
          Expanded(
            child: ButtonHub(onButtonClick: controller.onButtonClick),
            flex: 3,
          )
        ],
      ),
    );
  }
}
