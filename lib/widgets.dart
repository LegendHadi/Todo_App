import 'package:flutter/material.dart';

class TasksList extends StatefulWidget {
  final List tasks;
  final Function removeTask;
  const TasksList({super.key, required this.tasks, required this.removeTask});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          isChecked: widget.tasks[index].isDone,
          taskTitle: widget.tasks[index].name,
          checkboxCallback: () {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
          removeTask: widget.removeTask,
          index: index,
        );
      },
      itemCount: widget.tasks.length,
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
