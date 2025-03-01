import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey,
      ),
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

//Stateful class that contains 3 methods and stateful widget that displays the calc screen, number buttons, and arithmetic buttons
class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayText = "";

  //Updates the state of display by passing the string onPressed
  void updateDisplay(String number) {
    setState(() {
      displayText += number;
    });
  }

  //Resets the display by making the displayText empty
  void clearDisplay() {
    setState(() {
      displayText = "";
    });
  }

  //Method that evaluates the expression in the display
void evaluateExpression() {
  try {
    //changes the string inputs into operators
    String input = displayText.replaceAll('×', '*').replaceAll('÷', '/');

    // Uses regex to check if the input is divided by zero
    if (RegExp(r'/\s*0+(?![\d.])').hasMatch(input)) {
      setState(() {
        displayText = "Error: Division by 0";
      });
      return;
    }

    //Parses the expression to stores it into exp
    Parser p = Parser();
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    double result = exp.evaluate(EvaluationType.REAL, cm);

    //Changes the state of the result back to a string value and displays it  
    setState(() {
      displayText = result.toString();
    });
  } catch (e) {
    setState(() {
      displayText = "Error";
    });
  }
}

  //Widget that displays the calculator
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Top app bar that makes the color brown as well as the title.
      appBar: AppBar( 
        title: Text('Simple Calculator'),
        backgroundColor: Colors.brown,
      ),

      //Displays the screen given the dimensions as well as the allignment 
      body: Padding( 
        padding: EdgeInsets.only(top: 50), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                displayText,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
            
            
            
            //First Row of buttons containing arithmemtics along with clear and calculate methods
            SizedBox(height: 20), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: clearDisplay,
                  child: Text("C", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => updateDisplay("+"),
                  child: Text("+", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => updateDisplay("-"),
                  child: Text("-", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: evaluateExpression,
                  child: const Text("=", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            
            //Second row of buttons containing number 1-3 and * 
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => updateDisplay("1"),
                  child: Text("1", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => updateDisplay("2"),
                  child: Text("2", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => updateDisplay("3"),
                  child: Text("3", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => updateDisplay("*"),
                  child: Text("*", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            
            //Third row containing numbers 4-6 along with /
            SizedBox(height: 20), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => updateDisplay("4"),
                  child: Text("4", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => updateDisplay("5"),
                  child: Text("5", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => updateDisplay("6"),
                  child: Text("6", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => updateDisplay("/"),
                  child: Text("/", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),

            //Fourth row containing numbers 7-0
            SizedBox(height: 20), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => updateDisplay("7"),
                  child: Text("7", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => updateDisplay("8"),
                  child: Text("8", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => updateDisplay("9"),
                  child: Text("9", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => updateDisplay("0"),
                  child: Text("0", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
