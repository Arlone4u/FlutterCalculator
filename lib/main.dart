import 'package:flutter/material.dart';
import 'package:simple_calculator/calculator_button.dart';
import 'package:simple_calculator/palette.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String equation = "0";
  String result = "0";
  String expression = "";

  void btnOnClick(String btnVal) {
    print(btnVal);
    setState(() {
      if (btnVal == 'C') {
        equation = "0";
      } else if (btnVal == 'AC') {
        equation = "0";
        result = "0";
      } else if (btnVal == '<') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (btnVal == '+/-') {
        if (equation[0] != '-') {
          equation = '-' + equation;
        } else {
          equation = equation.substring(1);
        }
      } else if (btnVal == '=') {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          equation = result;
        } catch (e) {
          result = 'Error';
        }
      } else {
        if (equation == "0") {
          equation = btnVal;
        } else {
          equation = equation + btnVal;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: paletteBlueGrayShade700,
          centerTitle: true,
          title: Text(
            'Simple Calculator',
          ),
        ),
        backgroundColor: paletteTealShade800,
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.all(22),
                child: Text(
                  equation,
                  style: TextStyle(
                    color: paletteWhite,
                    fontFamily: 'Roboto',
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(22),
                child: Text(
                  result,
                  style: TextStyle(
                    color: paletteWhite,
                    fontFamily: 'Roboto',
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: 'AC',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 22,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: 'C',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '<',
                  fillColor: 0xFFFFAB40,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '/',
                  fillColor: 0xFFFFAB40,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '9',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '8',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '7',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '×',
                  fillColor: 0xFFFFAB40,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '6',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '5',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '4',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '-',
                  fillColor: 0xFFFFAB40,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '3',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '2',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '1',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '+',
                  fillColor: 0xFFFFAB40,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  text: '+/-',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 22,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '0',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '00',
                  fillColor: 0xFF4DB6AC,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
                CalculatorButton(
                  text: '=',
                  fillColor: 0xFFFFAB40,
                  textColor: 0xFF000000,
                  textSize: 24,
                  callback: btnOnClick,
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
