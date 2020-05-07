import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "RItesh Bista",
      theme: ThemeData(primaryColor: Colors.red),
      home: rbCalculator(),
    ));

class rbCalculator extends StatefulWidget {
  @override
  _rbCalculatorState createState() => _rbCalculatorState();
}

class _rbCalculatorState extends State<rbCalculator> {
  var _operation = ['Add', 'Subtraction', 'Multiply', 'Divide'];
  var _values= "Add";
  var _displayText ="";
  TextEditingController textBox1 =TextEditingController();
  TextEditingController textBox2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    var textField = TextField();
    return Scaffold(
        appBar: AppBar(
          title: Text('RB Calculator'),
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: ListView(
            children: <Widget>[
              //First Item
              DropdownButton<String>(
                value: _values,
                style: textStyle,
                items: _operation.map((String values) {
                  return DropdownMenuItem<String>(
                    value: values,
                    child: Text(values),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _values = value;
                    print('value changed to $value');
                  });
                  value = _values;
                },
              ),
              Padding(padding: EdgeInsets.only(bottom:5),),
              //Second Item

              TextField(
                controller: textBox1,
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: "First Number",
                    hintText: "100",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
                Padding(padding: EdgeInsets.only(bottom:5),),
              //Third Item
              TextField(
                controller: textBox2,
                style: textStyle,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Second Number",
                    hintText: "70",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              //fourth Item
              Text(_displayText,style: TextStyle(fontSize: 20),),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text('Calculate'),
                      onPressed: () {
                        setState(() {
                          double first = double.parse(textBox1.text);
    double second = double.parse(textBox2.text);
    switch(_values){
      case "Add":
      var sum = first+second;
      
        _displayText ="The sum is "+sum.toStringAsFixed(0);
      
      break;
       case "Subtraction":
      var dif = first-second;
      
        _displayText ="The sum is "+dif.toStringAsFixed(0);
      
      break;
       case "Multiply":
      var mul = first*second;
      
        _displayText ="The sum is "+mul.toStringAsFixed(0);
      
      break;
       case "Divide":
      var div = first/second;
      
        _displayText ="The sum is "+div.toStringAsFixed(0);
      
      break;
      default:
      _displayText ="Something Went Wrong";
    }
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text('Clear'),
                      onPressed: () {
                        setState(() {
                          _clearAll();
                        });
                      },
                    ),
                  ),
                ],
              )
              //Fifth Item
            ],
          ),
        ));
  }
  void _clearAll(){
    textBox1.text="";
    textBox2.text="";
  }
  void _calculateResult(value){
    
  }
}
