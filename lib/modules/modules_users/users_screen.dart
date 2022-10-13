import 'package:flutter/material.dart';

import '../../models/usre/user_model.dart';




class UsersScreen extends StatelessWidget {
List<UserModel> users = [
  UserModel(name: "Osama Mekawy", phone: "0106229742", id: 1),
  UserModel(name: "Khalid", phone: "0155629742", id: 2),
    UserModel(name: "Hesham Ayman", phone: "0106229742", id: 3),
  UserModel(name: "Osama Mekawy", phone: "0106229742", id: 1),
  UserModel(name: "Khalid", phone: "0155629742", id: 2),
  UserModel(name: "Hesham Ayman", phone: "0106229742", id: 3)
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users Data"),

      ),
      body: ListView.separated(itemBuilder: (context,index) =>user_Item(users[index]),
          separatorBuilder: (context,index) =>Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,

          ),
          itemCount: users.length
      )
    );
  }
  Widget user_Item(UserModel user)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25,
          child: Text("${user.id}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        ),
        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${user.name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            Text("${user.phone}",style: TextStyle(color: Colors.grey,fontSize: 15),)
          ],
        )
      ],
    ),
  );
}
