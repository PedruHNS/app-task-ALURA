import 'package:flutter/material.dart';
import 'package:app_task_alura/screens/home/components/card_task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required super.child});

  final List<TaskCard> taskList = [
    TaskCard(
        tarefa: "flutter",
        dificuldade: 1,
        urlImagem:
            "https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096"),
  ];

  void addTask(
      {required String tarefa,
      required int dificuldade,
      required String urlImagem}) {
    taskList.add(
      TaskCard(
        tarefa: tarefa,
        dificuldade: dificuldade,
        urlImagem: urlImagem,
      ),
    );
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, "no TaskInherited found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
