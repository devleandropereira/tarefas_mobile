import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/dash.png', 3),
    Task('Rachar', 'assets/images/fut.jpg', 4),
    Task('Assistir o Corintia', 'assets/images/craque_neto.jpg', 5),
    Task('Jogar', 'assets/images/game.jpg', 2),
    Task('Descansar', 'assets/images/praia.jpeg', 1)
  ];

  void addTask(String name, String url, int difficulty) {
    taskList.add(Task(name, url, difficulty));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
