import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class TasksList extends StatelessWidget {
  final Function removeTask;
  const TasksList({super.key, required this.removeTask});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              checkboxCallback: () {
                // setState(() {
                //   widget.tasks[index].toggleDone();
                // });
              },
              removeTask: removeTask,
              index: index,
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final int index;
  final Function checkboxCallback;
  final Function removeTask;
  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.index,
    required this.removeTask,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (value) {
          checkboxCallback();
        },
      ),
      leading: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          removeTask(index);
        },
      ),
    );
  }
}
