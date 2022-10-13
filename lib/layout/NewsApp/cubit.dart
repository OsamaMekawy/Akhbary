import 'package:bloc/bloc.dart';
import 'package:first_mansor/layout/NewsApp/states.dart';
import 'package:first_mansor/modules/news_buiesness/business_screen.dart';
import 'package:first_mansor/modules/news_science/science_screen.dart';
import 'package:first_mansor/modules/news_sports/sports_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/news_setting/settings_screen.dart';
import '../../sheared/sheared_network/sheared_network_remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit () : super (NewsInitialState());
  static NewsCubit get(context)=> BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItem =[
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center),
      label: "Business"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
      label: "Sports"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
      label: "Science"
    ),

  ];

  void changeBottomNavBar (int index){
    currentIndex = index;
    // if(index == 0)
    //   getBusiness();
    // if(index == 1)
    //   getSports();
    // if(index == 2)
    //   getScience();
    emit(NewsBottomNavState());
  }

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];

  List<dynamic> business = [];

  void getBusiness(){
    emit(NewsGetBuisnesslodiningState());
    DioHelper.getData(url: 'v2/top-headlines  ',
        query: {
          'country':'eg',
          'category':'business',
          'apikey': '65f7f556ec76449fa7dc7c0069f040ca'
        }
    ).then((value) {
     // print(value.data.toString());
      business = value.data['articales'];
      print(business[0]['title']);
      emit( NewsGetBuisnessSuccessState());
    }).catchError((erorr){
      print(erorr.toString());
      emit(NewsGetBuisnessErorrState(erorr.toString()));
    });

  }

  List<dynamic> sports = [];

  void getSports(){
    emit(NewsGetSportslodiningState());
    if(sports.length==0)
      {
        DioHelper.getData(url: 'v2/top-headlines',
            query: {
              'country':'eg',
              'category':'sports',
              'apikey': '65f7f556ec76449fa7dc7c0069f040ca'
            }
        ).then((value) {
          // print(value.data.toString());
          sports = value.data['articales'];
          print(sports[0]['title']);
          emit( NewsGetSportsSuccessState());
        }).catchError((erorr){
          print(erorr.toString());
          emit(NewsGetSportsErorrState(erorr.toString()));
        });
      }else
        {
          emit( NewsGetSportsSuccessState());
        }


  }

  List<dynamic> science = [];

  void getScience(){
    emit(NewsGetSciencelodiningState());
    if(science==0)
      {
        DioHelper.getData(url: 'v2/top-headlines',
            query: {
              'country':'eg',
              'category':'science',
              'apikey': '65f7f556ec76449fa7dc7c0069f040ca'
            }
        ).then((value) {
          // print(value.data.toString());
          science = value.data['articales'];
          print(science[0]['title']);
          emit( NewsGetScienceSuccessState());
        }).catchError((erorr){
          print(erorr.toString());
          emit(NewsGetScienceErorrState(erorr.toString()));
        });
      }else{
      emit( NewsGetScienceSuccessState());
    }


  }
}