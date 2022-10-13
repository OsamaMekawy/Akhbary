import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Flex"),
        actions: [
          IconButton(onPressed: (){print("hello");}, icon:  Icon(Icons.notifications),),
          IconButton(onPressed: oncleaked, icon:  Icon(Icons.search))


        ],
      ),
    );
  }
  void oncleaked(){
    print("hello osama");
  }
}
