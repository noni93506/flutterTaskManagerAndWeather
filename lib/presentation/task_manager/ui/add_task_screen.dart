import 'package:flutter/material.dart';
import 'package:task_manager_and_weather/presentation/common/app_button.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(String, String, int) onApply;

  const AddTaskScreen({
    super.key,
    required this.onApply,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDesc = TextEditingController();
  int cat = 0;

  @override
  void initState() {
    _controllerTitle.text = 'title';
    _controllerDesc.text = 'text';
    super.initState();
  }

  @override
  void dispose() {
    _controllerTitle.dispose();
    _controllerDesc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controllerTitle,
              ),
              TextField(
                controller: _controllerDesc,
              ),
              Row(//todo move
                  children: [
                    const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cat = 0;
                    });
                  },
                  child: const Icon(
                    Icons.work,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cat = 1;
                    });
                  },
                  child: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      cat = 2;
                    });
                  },
                  child: const Icon(
                    Icons.sports_basketball,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
              ]),
              Row(//todo move
                  children: [
                AppButton(
                    text: "apply",
                    onPressed: () {
                      _addTask(_controllerTitle.text, _controllerDesc.text, cat);
                    }),
                const Spacer(),
                AppButton(
                  text: "cancel",
                  onPressed: () => _goBack(context),
                ),
              ])
            ]),
      ),
    );
  }

  _addTask(String title, String desc, int cat) {
    widget.onApply(title, desc, cat);
    _goBack(context);
  }

  _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
