import 'package:flutter/material.dart';
import 'package:simple_calculator/calculator_button.dart';
import 'package:simple_calculator/palette.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late int firstNumber;
  late int secondNumber;
  String history = '';
  String textToDisplay = '';
  late String res;
  late String operation;

  void btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == 'C') {
      textToDisplay = '';
      firstNumber = 0;
      secondNumber = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNumber = 0;
      secondNumber = 0;
      res = '';
      history = '';
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-' + textToDisplay;
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'X' ||
        btnVal == '/') {
      firstNumber = int.parse(textToDisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondNumber = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNumber + secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == '-') {
        res = (firstNumber - secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == 'X') {
        res = (firstNumber * secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == '/') {
        res = (firstNumber / secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = res;
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
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  history,
                  style: TextStyle(
                    color: paletteTransparent,
                    fontFamily: 'Roboto',
                    fontSize: 24,
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
                  textToDisplay,
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
                  text: 'X',
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
