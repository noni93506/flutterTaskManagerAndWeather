import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_and_weather/_infra/app_service_locator.dart';
import 'package:task_manager_and_weather/data/models/database/task.dart';
import 'package:task_manager_and_weather/presentation/common/app_app_bar.dart';
import 'package:task_manager_and_weather/presentation/task_manager/task_manager_cubit.dart';
import 'package:task_manager_and_weather/presentation/task_manager/task_manager_state.dart';
import 'package:task_manager_and_weather/presentation/task_manager/ui/task_tile.dart';

class TaskManager extends StatelessWidget {
  TaskManager({Key? key}) : super(key: key);
  final _screenBloc = getIt<TaskManagerCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskManagerCubit, TaskManagerState>(
      bloc: _screenBloc,
      listener: (context, state) {
        // todo loader and error handler
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => _goBack(context),
                icon: const Icon(Icons.chevron_left_sharp),
              ),
            ),
            floatingActionButton: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _openAddTask(context),
            ),
            body: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for(var data in state.filteredTasks) ... {
                      TaskTIle(data: data),
                    },
                  ]
              ),
            )
        );
      },
    );
  }


  _openAddTask(BuildContext context) {
    _screenBloc.addTask(title: "title", description: "description", category: 2);
  }

  _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }

}
//TaskTIle(data: Task(id: 1,title: "test title", description: "description test", category: 0, ),)
