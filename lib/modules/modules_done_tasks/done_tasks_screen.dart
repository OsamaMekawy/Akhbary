import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../sheared/cubit/cubit.dart';
import '../../sheared/cubit/states.dart';
import '../../sheared/sheared_componunts/componunts.dart';

class DoneTasksScren extends StatelessWidget {
  const DoneTasksScren({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: ( context,state){},
      builder: (context,state){
        var tasks = AppCubit.get(context).doneTasks;
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
