import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
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
  final int index;
  const TaskTile({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskData>(context).tasks[index];
    return ListTile(
      title: Text(
        task.name,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: task.isDone,
        onChanged: (value) {
          Provider.of<TaskData>(context, listen: false).checkOn(index);
        },
      ),
      leading: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          Provider.of<TaskData>(context, listen: false).deleteTask(index);
        },
      ),
    );
  }
}
