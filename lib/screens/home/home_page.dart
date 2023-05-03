import 'package:flutter/material.dart';

import 'components/card_task.dart';

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
      body: ListView(
        children: const [
          TaskCard(
              tarefa: "flutter",
              dificuldade: 1,
              urlImagem:
                  "https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed("/addTask"),
        child: const Icon(Icons.add_task_sharp),
      ),
    );
  }
}
