import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter=0;

  init() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    int c = (sp.getInt('counter') ?? 0);
    setState(() {
      this.counter = c;
    });
  }


  @override
  void initState(){
    this.init();
    super.initState();
  }

  increment() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      this.counter++;
      sp.setInt('counter', this.counter);
    });
  }

  decrement() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      this.counter--;
      sp.setInt('counter', this.counter);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter App'),),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$counter"),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('-'),
              onPressed: (){
                setState(() {
            this.decrement();
                });
              },
            ),
            RaisedButton(
              child: Text('+'),
              onPressed: (){
             setState(() {
              this.increment();
             });

              },
            ),
          ],
        )
      ],
    ),
    );

  }
}

