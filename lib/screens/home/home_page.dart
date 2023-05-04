import 'package:app_task_alura/data/task_inherited.dart';
import 'package:flutter/material.dart';



class HomeTaskPage extends StatelessWidget {
  const HomeTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 181, 139, 248),
        leading: Container(),
        title: const Text("App Task"),
      ),
      body: ListView(children: TaskInherited.of(context).taskList),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("/addTask"),
        child: const Icon(Icons.add_task_sharp),
      ),
    );
  }
}
