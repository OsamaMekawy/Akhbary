import 'package:first_mansor/layout/NewsApp/cubit.dart';
import 'package:first_mansor/layout/NewsApp/states.dart';
import 'package:first_mansor/sheared/cubit/cubit.dart';
import 'package:first_mansor/sheared/sheared_network/sheared_network_remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("News App"),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                IconButton(onPressed: (){
                  AppCubit.get(context).changeAppMood();
                }, icon: Icon(Icons.brightness_4_outlined)),
              ],
            ),


            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                 cubit.changeBottomNavBar(index);
              },
              items:cubit. bottomItem ,
            ),
          );
        },
      ),
    );
  }
}
