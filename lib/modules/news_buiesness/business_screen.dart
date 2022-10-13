import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:first_mansor/layout/NewsApp/cubit.dart';
import 'package:first_mansor/layout/NewsApp/states.dart';
import 'package:first_mansor/sheared/sheared_componunts/componunts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
        builder: (context, state){

        var list = NewsCubit.get(context).business;
        return ConditionalBuilder(condition: list.length>0,
            builder: (context)=>ListView.separated(
              physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buildArticalItem(list[index],context),
                separatorBuilder: (context , index)=>Divider(color: Colors.black,),
                itemCount: 10
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator(),)
        );
        },

    );



  }
}
