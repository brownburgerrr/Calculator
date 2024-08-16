import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: calculator(),
    );
  }
}

class calculator extends StatefulWidget {
  const calculator({super.key});

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {

   dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;
  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  
  Widget calcbutton(String btnText, Color btnColor, Color txtColor) {
    return Container(
      child: RawMaterialButton(
        onPressed: () {
          setState(() {
            calculation(btnText);
          });
        },
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 35,
            color: txtColor,
          ),
        ),
        shape: CircleBorder(),
        fillColor: btnColor,
        padding: EdgeInsets.all(20),
      ),
    );
  }

  void calculation(String btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = (numOne / 100).toString();
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF880d1e),
      appBar: AppBar(title: const Text("Calculator", style: TextStyle(color: Color(0xFFcbeef3), fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),), backgroundColor: const Color(0xFF880d1e), ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(text,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xFFcbeef3),
                        fontSize: 100
                      ),
                     )
                    )
                  ],
                ),
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton('AC', Color(0xFFf49cbb), Color(0xFF880d1e)),
                  calcbutton('+/-', Color(0xFFf49cbb), Color(0xFF880d1e)),
                  calcbutton('%', Color(0xFFf49cbb), Color(0xFF880d1e)),
                  calcbutton('/', Color(0xFFf26a8d), Color(0xFFcbeef3)),
                ],
              ),
              SizedBox(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton('7', Color(0xFFdd2d4a), Color(0xFFcbeef3)),
                  calcbutton('8', Color(0xFFdd2d4a), Color(0xFFcbeef3)),
                  calcbutton('9', Color(0xFFdd2d4a), Color(0xFFcbeef3)),
                  calcbutton('x', Color(0xFFf26a8d), Color(0xFFcbeef3)),
                ],
              ),
              SizedBox(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton('4', Color(0xFFdd2d4a), Color(0xFFcbeef3)),
                  calcbutton('5', Color(0xFFdd2d4a), Color(0xFFcbeef3)),
                  calcbutton('6', Color(0xFFdd2d4a), Color(0xFFcbeef3)),
                  calcbutton('-', Color(0xFFf26a8d), Color(0xFFcbeef3)),
                ],
              ),
              SizedBox(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  calcbutton('1', Color(0xFFdd2d4a), Color(0xFFcbeef3)),
                  calcbutton('2', Color(0xFFdd2d4a), Color(0xFFcbeef3)),
                  calcbutton('3', Color(0xFFdd2d4a), Color(0xFFcbeef3)),
                  calcbutton('+', Color(0xFFf26a8d), Color(0xFFcbeef3)),
                ],
              ),
              SizedBox(height: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RawMaterialButton(
                  padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                   onPressed: () { 
                    calculation('0');
                    },
                    shape: StadiumBorder(),
                    child: Text(
                      "0",
                      style: TextStyle(
                        color: Color(0xFFcbeef3),
                        fontSize: 35
                      ),
                    ),
                    fillColor: Color(0xFFdd2d4a),
                  ),
                  calcbutton('.', Color(0xFFdd2d4a), Color(0xFFcbeef3)),
                  calcbutton('=', Color(0xFFf26a8d), Color(0xFFcbeef3)),
                ],
              ),
              SizedBox(height: 5),
              
          ],
        ),
      ),
    );
  }
}

