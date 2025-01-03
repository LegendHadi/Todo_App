import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addNewTask;
  const AddTaskScreen({super.key, required this.addNewTask});

  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(
              fontSize: 30,
              color: Colors.lightBlueAccent,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (value) {
              newTaskTitle= value;
            },
          ),
          ElevatedButton(
            onPressed: () {
              addNewTask(newTaskTitle);
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.lightBlueAccent),
              padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 40, vertical: 10))
            ),
            child: const Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
