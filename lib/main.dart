import 'package:flutter/material.dart';
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
    '+/-',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                  color: Colors.blueAccent,
                  alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(40),
                child: Text(userInput,
                style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                ),
                Container(
                  color: Colors.blueAccent,
                  alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(20),
                child: Text(result,
                style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 4, mainAxisSpacing: 4),
                 itemBuilder: (BuildContext context, int index ){
                  if (index == 0){
                    return ElevatedButton(
              
                      child: Text(buttons[index],style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        setState(() {
                          userInput = '';
                          result = '';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        
                      ),
                    );
                  }else if (index == 1){
                    return ElevatedButton(
                      onPressed: () {  },
                      child: Text(buttons[index],style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        
                      ),
                      
                    );
                  }else if (index == 2){
                    return ElevatedButton(
                      child: Text(buttons[index],style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        
                      ),
                      onPressed: (){
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                    );
                  }else if (index == 3){
                    return ElevatedButton(
                      child: Text(buttons[index],style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        
                      ),
                      onPressed: (){
                        setState(() {
                          userInput = userInput.substring(0,userInput.length - 1);
                        });
                      },
                    );
                  }else if (index == 18){
                    return ElevatedButton(
                      child: Text(buttons[index],style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        
                      ),
                      onPressed: (){
                        setState(() {
                          calculate();
                        });
                      },
                    );
                  }else if (index == 7 || index == 11 || index == 15 || index == 19){
                    return ElevatedButton(
                      child: Text(buttons[index],style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        
                      ),
                      onPressed: (){
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                      );
                  } 
                  else{
                    return ElevatedButton(
                      child: Text(buttons[index],style: TextStyle(color: Colors.black),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        
                      ),
                      onPressed: (){
                        setState(() {
                          userInput += buttons[index];
                        });
                      },
                    );
                  }
                 },
                 ),
              ),
          ],
          

        ),
      ),
    );
  }

}