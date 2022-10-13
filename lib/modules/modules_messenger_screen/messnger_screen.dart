import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 15,
          elevation:0.0 ,
        backgroundColor: Colors.white,
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
              ),
              SizedBox(width: 15,),
              Text("Chats",style: TextStyle(color: Colors.black,fontSize: 20),)
            ],
      ),
        actions: [
          IconButton(onPressed: (){},
              icon: CircleAvatar(
                backgroundColor: Colors.blue,
                  radius: 25,
                  child: Icon(Icons.camera_alt,color: Colors.white,size: 22,)
              ),
          ),
          IconButton(onPressed: (){},
            icon: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 25,
                child: Icon(Icons.edit,color: Colors.white,size: 22,)
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20)
                ),
                padding: EdgeInsets.all(7),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10,),
                    Text("Search")
                  ],
                ),
              ),
              SizedBox(height: 12,),
             Container(
               height: 120,
               child: ListView.separated(
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 itemBuilder:
                   (contex,index) =>build_item_Container(),
                 itemCount: 10,
                 separatorBuilder: (context,index)=> SizedBox(width: 20,),

               ),
             ),
              SizedBox(height: 2,),
               ListView.separated(
                 physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemBuilder:  (context,index)=>build_item_Row(),
                    separatorBuilder: (context,index)=> SizedBox(height: 20,),
                    itemCount: 15
                ),


            ],
          ),
        ),
      ),
    );
  }

  Widget build_item_Row() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 25,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
            child: CircleAvatar(
              radius: 7,
              backgroundColor: Colors.red,
            ),
          ),

        ],
      ),
      SizedBox(width: 20,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("oSAMA Mekawy",maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Row(
              children: [
                Expanded(child: Text("hello my name is osamahello my name is osamahello my name is osamahello my name is osama",maxLines: 2,overflow: TextOverflow.ellipsis)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(color: Colors.blue,shape: BoxShape.circle,),
                  ),
                ),
                Text("02:00 PM"),
              ],
            )


          ],
        ),
      )

    ],
  );
  Widget build_item_Container() => Container(
    width: 50,
    child: Column(

      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 3,end: 3),
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.red,
              ),
            ),

          ],
        ),
        SizedBox(height: 5,),
        Text("Osama Mohamed AddeLrahman Mekawy",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )

      ],
    ),
  );
}
