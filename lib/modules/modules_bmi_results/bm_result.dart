import 'package:flutter/material.dart';

class BimResults extends StatelessWidget {
final int age;
final bool isMale;
final int results;
BimResults({
  required this.age,
  required this.isMale,
  required this.results
});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bim results"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Gender :${isMale?"Male":"Female"}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
            Text("Results :${results}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
            Text("Age :${age}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
          ],
        ),
      ),
    );
  }
}
