import 'dart:collection';

import 'package:todoey_flutter/models/task.dart';
import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(
      _tasks); //I cannot modify it elsewhere. It is just a getter so that I can have access to it in tasks_list

  int get taskCount => _tasks.length;

  void addTask(String newTaskTitle) {
    _tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  //Angela's
  void checkBoxState(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  //Angela's
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

//auto eixa kanei egw kai douleue mia xara
//  void deleteTask(int index) {
//    _tasks.removeAt(index);
//    notifyListeners();
//  }

//auto eixa kanei egw kai douleue mia xara
//  void checkBoxState(int index) {
//    _tasks[index].toggleDone();
//    notifyListeners();
//  }
}
