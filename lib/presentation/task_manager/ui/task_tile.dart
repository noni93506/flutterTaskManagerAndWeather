import 'package:flutter/material.dart';
import 'package:task_manager_and_weather/data/models/database/task.dart';
import 'package:task_manager_and_weather/presentation/task_manager/model/category.dart';
import 'package:task_manager_and_weather/resources/AppTextStyle.dart';

class TaskTile extends StatelessWidget {  /// Special widget for [Task]
  final Task data;
  final Function(Task) onPressed;
  final Function(Task) onLongTap;

  const TaskTile({
    super.key,
    required this.data,
    required this.onPressed,
    required this.onLongTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onPressed(data), // single tap for update
      onLongPress: ()=> onLongTap(data), // long tap for delete
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration:
            BoxDecoration(
              border: Border.all(width: 2, color: data.done ? Colors.green : Colors.redAccent),
              borderRadius: BorderRadius.circular(16),
              color: Colors.transparent, // must be here, or GestureDetector will only recognize when tap is on text or icon
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Categories.values[data.category].iconData),
             const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(data.title, style: AppTextStyles.h1Bold),
                Text(data.description, style: AppTextStyles.h2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
