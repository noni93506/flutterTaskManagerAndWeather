import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_and_weather/_infra/app_service_locator.dart';
import 'package:task_manager_and_weather/presentation/common/filtered_snack_bar.dart';
import 'package:task_manager_and_weather/presentation/task_manager/task_manager_cubit.dart';
import 'package:task_manager_and_weather/presentation/task_manager/task_manager_state.dart';
import 'package:task_manager_and_weather/presentation/task_manager/ui/add_task_screen.dart';
import 'package:task_manager_and_weather/presentation/task_manager/ui/task_tile.dart';

class TaskManager extends StatelessWidget {
  TaskManager({Key? key}) : super(key: key);
  final _screenBloc = getIt<TaskManagerCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskManagerCubit, TaskManagerState>(
      bloc: _screenBloc,
      listener: (context, state) {
        // todo in future can be added loader and error handler using context extension
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => _goBack(context),
                icon: const Icon(Icons.chevron_left_sharp),
              ),
              actions: [
                IconButton(
                  onPressed: () => _screenBloc.sortByDone(),
                  icon: const Icon(Icons.sort),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () => _openFilter(context),
                  icon: const Icon(Icons.filter_alt),
                ),
              ],
            ),
            floatingActionButton: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _openAddTask(context),
            ),
            body: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                for (var data in state.filteredTasks) ...{
                  TaskTile(
                    data: data,
                    onPressed: (task) => _screenBloc.markAsReady(task),
                    onLongTap: (task) => _screenBloc.deleteTask(task),
                  ),
                },
              ]),
            ));
      },
    );
  }

  _openAddTask(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AddTaskScreen(
              onApply: (title, desc, cat) =>
                  _screenBloc.addTask(title: title, description: desc, category: cat), /// to reduce code,
          /// can change to single parameter Task but without cubit in AddTaskScreen, it would be problem to generate id for Task in there
            )));
  }

  _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  _openFilter(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        AppSnackBar(onAction: (cat) => _screenBloc.filterByCat(cat)));
  }
}
