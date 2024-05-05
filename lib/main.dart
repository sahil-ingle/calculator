import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';


void main() {
  runApp(const MainApp());
}



class MainApp extends StatefulWidget {
  const MainApp({super.key});


  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  var result = "";
  var userInput = "";

  List <String> buttons = [
    'AC',
    '%',
    '/',
    'DEL',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '00',
    '0',
    '.',
    '=',
  ];

  void calculate(){
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');
 
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    result = eval.toString();
  }

  void onButtonPress(String button){
    setState(() {
      if (button == 'AC'){
        userInput = '';
        result = '';
      }else if(button == 'DEL'){
        userInput = userInput.substring(0,userInput.length - 1);
      }else if (button == '='){
        calculate();
      }else{
        userInput+=button;
      }
    });
  }

  Color textColor(String button){
    if (button == 'AC' || button == '%' || button == '/' || button == '+' || button == '-' || button == 'DEL' || button == 'x' || button == '='){
      return Colors.white;
  }else {
      return Colors.black;
    }
  }
  Color getColor(String button){
    if (button == 'AC' || button == '%' || button == '/' || button == '+' || button == '-' || button == 'DEL' || button == 'x'){
      return Colors.blueAccent;
    }else if (button == '='){
      return Colors.redAccent;
    }else{
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                  Expanded(
                    child: Container(
                      color: Colors.lightBlueAccent,
                      alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(20),
                    child: Text(userInput,
                    style: const TextStyle(fontSize: 56, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 2,
                    height: 0,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.lightBlueAccent,
                      alignment: Alignment.centerRight,
                    padding: const EdgeInsets.all(20),
                    child: Text(result,
                    style: const TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),
              Expanded(
                flex:3,
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 4, mainAxisSpacing: 4),
                   itemBuilder: (BuildContext context, int index ){
                      return ElevatedButton(
                        onPressed: (){
                          onButtonPress(buttons[index]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: getColor(buttons[index]),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          
                        ),
                        child: Text(buttons[index],style: TextStyle(
                          color: textColor(buttons[index]),
                          fontSize: 25,
                          ),
                          ),
                      );
                   },
                   ),
                ),
            ],
            
          
          ),
        ),
      ),
    );
  }

}