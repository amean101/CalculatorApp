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

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayText = "";

  void updateDisplay(String number) {
    setState(() { 
      displayText += number;
    });
  }

  void clearDisplay() {
    setState(() {
      displayText = "";
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator'),
      backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50), // Space from the top
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display screen at the top with space
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
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(height: 20), // Space between display and buttons

            // Button row
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
                  onPressed:  () => updateDisplay("="),
                  child: const Text("=", style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
                      SizedBox(height: 20), // Space between display and buttons

            // Button row
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
                      SizedBox(height: 20), // Space between display and buttons

            // Button row
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
                      SizedBox(height: 20), // Space between display and buttons

            // Button row
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
