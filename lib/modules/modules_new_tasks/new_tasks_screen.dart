import 'package:first_mansor/sheared/cubit/cubit.dart';
import 'package:first_mansor/sheared/cubit/states.dart';
import 'package:first_mansor/sheared/sheared_componunts/conestans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../sheared/sheared_componunts/componunts.dart';

class NewTasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: ( context,state){},
      builder: (context,state){
        var tasks = AppCubit.get(context).newTasks;
        return  ListView.separated(
            itemBuilder: (context,index)=> buildTasksItem(tasks[index],context),
            separatorBuilder: (context,index) => Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            itemCount: tasks.length
        );
      },

    );
  }
}
