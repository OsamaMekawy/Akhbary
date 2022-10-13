import 'package:first_mansor/modules/bmi/bim_calculater.dart';
import 'package:first_mansor/modules/modules_home/home.dart';
import 'package:first_mansor/modules/modules_users/users_screen.dart';
import 'package:first_mansor/sheared/cubit/cubit.dart';
import 'package:first_mansor/sheared/cubit/states.dart';
import 'package:first_mansor/sheared/sheared_network/sheared_network_local/cache_helper.dart';
import 'package:first_mansor/sheared/sheared_network/sheared_network_remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'layout/NewsApp/news_layout.dart';
import 'layout/todoApp/home_layot.dart';
import 'modules/modules_bmi/bim_calculater.dart';
import 'modules/modules_bmi_results/bm_result.dart';
import 'modules/modules_login/login_screen.dart';
import 'modules/modules_messenger_screen/messnger_screen.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CacheHelper.init();

// bool? isDark = CacheHelper.getBoolen(key: "isDark");
  runApp(MyApp());
  //isDark!
}
class MyApp extends StatelessWidget {
 // final bool isDark;

 const MyApp();
 //this.isDark


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..changeAppMood(
        //fromShared: isDark
      ),
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(context,state)=>{} ,
      builder: (context,state){
          return MaterialApp(
            theme: ThemeData(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  titleTextStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(
                      color: Colors.black
                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  elevation: 20
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  )
              ),
            ),
            darkTheme: ThemeData(
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange
              ),
              scaffoldBackgroundColor: HexColor("333739"),
              appBarTheme: AppBarTheme(
                  backgroundColor: HexColor("333739"),
                  elevation: 0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:HexColor("333739"),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  titleTextStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(
                      color: Colors.white
                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20,
                backgroundColor: HexColor("333739"),
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  )
              ),

            ),
            themeMode: AppCubit.get(context).isDark?ThemeMode.dark : ThemeMode.light,

            debugShowCheckedModeBanner: false,
            home:NewsLayout(),
          );
      },
      ),
    );
  }
}



// MaterialApp(
// theme: ThemeData(
// floatingActionButtonTheme: FloatingActionButtonThemeData(
// backgroundColor: Colors.deepOrange
// ),
// scaffoldBackgroundColor: Colors.white,
// appBarTheme: AppBarTheme(
// backgroundColor: Colors.white,
// elevation: 0,
// backwardsCompatibility: false,
// systemOverlayStyle: SystemUiOverlayStyle(
// statusBarColor: Colors.white,
// statusBarIconBrightness: Brightness.dark,
// ),
// titleTextStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
// iconTheme: IconThemeData(
// color: Colors.black
// )
// ),
// bottomNavigationBarTheme: BottomNavigationBarThemeData(
// type: BottomNavigationBarType.fixed,
// selectedItemColor: Colors.deepOrange,
// elevation: 20
// ),
// textTheme: TextTheme(
// bodyText1: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.w600,
// color: Colors.black
// )
// ),
// ),
// darkTheme: ThemeData(
// floatingActionButtonTheme: FloatingActionButtonThemeData(
// backgroundColor: Colors.deepOrange
// ),
// scaffoldBackgroundColor: HexColor("333739"),
// appBarTheme: AppBarTheme(
// backgroundColor: HexColor("333739"),
// elevation: 0,
// backwardsCompatibility: false,
// systemOverlayStyle: SystemUiOverlayStyle(
// statusBarColor:HexColor("333739"),
// statusBarIconBrightness: Brightness.light,
// ),
// titleTextStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
// iconTheme: IconThemeData(
// color: Colors.white
// )
// ),
// bottomNavigationBarTheme: BottomNavigationBarThemeData(
// type: BottomNavigationBarType.fixed,
// selectedItemColor: Colors.deepOrange,
// unselectedItemColor: Colors.grey,
// elevation: 20,
// backgroundColor: HexColor("333739"),
// ),
// textTheme: TextTheme(
// bodyText1: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.w600,
// color: Colors.white
// )
// ),
//
// ),
// themeMode: ThemeMode.light,
//
// debugShowCheckedModeBanner: false,
// home:NewsLayout(),
// ),


