import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home : Home(),
));
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

 int num1=0;
 int num2=0;
 String res="";
 String operatorper="";
 String textdisplay="";
 void btnclicked(String btnval){
    if (btnval=='C'){
      num1=0;
      num2=0;
      res="";
      textdisplay="";
      operatorper="";
    }
    else if(btnval=='+' || btnval=='-' || btnval=='x'|| btnval=='/'){
      num1=int.parse(textdisplay);
      res="";
      operatorper=btnval;
    }
    else if(btnval== "="){
      num2=int.parse(textdisplay);
      if(operatorper=="+")
        res=(num1+num2).toString();
      if(operatorper=="-")
        res=(num1-num2).toString();
      if(operatorper=="x")
        res=(num1*num2).toString();
      if(operatorper=="/")
        res=(num1~/num2).toString();
    }
    else {
      res = int.parse(textdisplay + btnval).toString();
    }
    setState(() {
      textdisplay=res;
    });
 }

  Widget CustomButton(String btnval){
    return Expanded(
        child: OutlinedButton(
          onPressed: () =>btnclicked(btnval),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0,0,8,8),
            child: Text('$btnval',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            ),
          ),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Calculator'),
        centerTitle: true,
      ),
      body:
      Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment : Alignment.bottomRight,
                child  : Text('$textdisplay',

                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,

                  ),

                ),
              ),
              Row(
                children: <Widget>[
                    CustomButton('9'),
                    CustomButton('8'),
                    CustomButton('7'),
                    CustomButton('+'),
                ],
              ),
              Row(
                children: <Widget>[
                  CustomButton('6'),
                  CustomButton('5'),
                  CustomButton('4'),
                  CustomButton('-'),
                ],
              ),
              Row(
                children: <Widget>[
                  CustomButton('3'),
                  CustomButton('2'),
                  CustomButton('1'),
                  CustomButton('x'),
                ],
              ),
              Row(
                children: <Widget>[
                  CustomButton('C'),
                  CustomButton('0'),
                  CustomButton('='),
                  CustomButton('/'),
                ],
              ),
            ],
          ),
      ),

      );
  }
}





