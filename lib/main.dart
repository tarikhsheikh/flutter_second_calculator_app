import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalCulator ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 late int firstNumber;
 late int secondNumber;
 //String history="";
 String textDisplay="";
 late String result;
 late String operation;

 void btnOnClick(String btnVal){
      if(btnVal=='C'){
        textDisplay="";
        firstNumber =0;
        secondNumber =0;
        result="";
      }
       else if ( btnVal=="+"||
       btnVal =="-"||
        btnVal == "x" ||
         btnVal=="/"
         ){
        firstNumber=int.parse(textDisplay);
        result="";
        operation =btnVal;
      }
      else if (btnVal=="="){
        secondNumber =int.parse(textDisplay);
        if(operation =="+"){

          result =(firstNumber+secondNumber).toString();
         // history=firstNumber.toString()+operation.toString()+secondNumber.toString();
        }
         if(operation =="-"){

          result =(firstNumber-secondNumber).toString();
         // history=firstNumber.toString()+operation.toString()+secondNumber.toString();
        }
         if(operation =="x"){

          result =(firstNumber*secondNumber).toString();
        //  history=firstNumber.toString()+operation.toString()+secondNumber.toString();
        }
         if(operation =="/"){

          result =(firstNumber ~/ secondNumber).toString();
         // history=firstNumber.toString()+operation.toString()+secondNumber.toString();
        }
      }
        else{
          result =int.parse(textDisplay+btnVal).toString();
        }
        setState(() {
          textDisplay=result;
        });



 }

 Widget calculatorbtn (String btnVal){
   return Expanded(
          child: OutlineButton(

            padding: EdgeInsets.all(25.0),
            onPressed: ()=>btnOnClick(btnVal),
            child: Text("$btnVal",
            style: TextStyle(
              fontSize:25.0,
              color: Colors.teal,
            ),
            ),
          ),
   );

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
      title : Text('Flutter Calculator'),

     ),
     body: Container( 
       color: Colors.black,       
          child: Column(
            mainAxisAlignment:MainAxisAlignment.end,

            children: [
              Expanded(
              
           child: Container(
                child:Padding(
                  padding: EdgeInsets.all(12),
                    child:Text(
                      "$textDisplay",
                      style: TextStyle(
                        fontSize:32,
                         color: Colors.white
                         ),
                         ),
                ),
                alignment: Alignment(1.0,1.0),
              ),
              ),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 calculatorbtn( '9' ),
                 calculatorbtn( '8'),
                 calculatorbtn( '7'),
                 calculatorbtn('+'),
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 calculatorbtn( '6' ),
                 calculatorbtn( '5'),
                 calculatorbtn('4'),
                 calculatorbtn( '-'),
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 calculatorbtn('3' ),
                 calculatorbtn( '2'),
                 calculatorbtn( '1'),
                 calculatorbtn('x'),
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 calculatorbtn( 'C' ),
                 calculatorbtn( '0'),
                 calculatorbtn( '='),
                 calculatorbtn( '/'),
                ],
              ),
            ],
              ),
          ),
         
     
   
      );
    
      }
    }
  