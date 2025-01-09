import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'buy milk'),
    Task(name: 'buy eggs'),
    Task(name: 'buy bread'),
  ];
  int get taskCount {
    return tasks.length;
  }

  void addTask(String newTask) {
    tasks.add(Task(name: newTask));
    notifyListeners();
  }

  void checkOn(int index) {
    tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.remove(tasks[index]);
    notifyListeners();
  }
}
