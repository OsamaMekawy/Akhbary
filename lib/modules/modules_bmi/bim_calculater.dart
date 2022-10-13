import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules_bmi_results/bm_result.dart';

class BimCalculater extends StatefulWidget {
  const BimCalculater({Key? key}) : super(key: key);

  @override
  _BimCalculaterState createState() => _BimCalculaterState();
}

class _BimCalculaterState extends State<BimCalculater> {
  bool isMale = true;
  double height = 120.0;
  int age = 20;
  int weight = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bim Calculater"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                           isMale = true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("assets/images/male.png"),height: 90,width: 90,),
                            SizedBox(height: 10,),
                            Text("Male",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: isMale? Colors.blue : Colors.grey
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40,),
                  Expanded(
                    child: GestureDetector(onTap: (){
                      setState(() {
                         isMale = false;
                      });
                    },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("assets/images/female.png"),height: 90,width: 90,),
                            SizedBox(height: 10,),
                            Text("feMale",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: isMale? Colors.grey : Colors.blue
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Expanded(
            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hieght",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("${height.round()}",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 40),),
                        SizedBox(width: 5,),
                        Text("cm",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 20),),
                      ],
                    ),
                    Slider(
                        value: height,
                        max: 220,
                        min: 80,


                        onChanged: (value){
                          setState(() {
                            height = value;
                          });

                        }
                    ),
                  ],
                ),
                decoration: BoxDecoration(color: Colors.grey[400],borderRadius: BorderRadius.circular(10)),
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Wieght",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                          Text("$weight",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 40),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){

                                setState(() {
                                  weight --;
                                });
                              },
                                heroTag: "weight -",
                                child: Icon(Icons.remove),
                                mini: true,

                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight ++;
                                });
                              },
                                heroTag: "weight +",
                                child: Icon(Icons.add),
                                mini: true,

                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),

                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Age",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                          Text("$age",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 40),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                                heroTag: 'age -',
                                child: Icon(Icons.remove),
                                mini: true,

                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                                heroTag: 'age +',
                                child: Icon(Icons.add),
                                mini: true,

                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(onPressed: (){
              double result = weight/pow(height/100, 2);
              print(result.round());
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new BimResults(age: age,isMale: isMale,results: result.round(),)));
            },
              height: 50,
              child: Text("Calculat",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
