import 'package:app_task_alura/data/task_dao.dart';

import 'package:app_task_alura/screens/home/components/card_task.dart';
import 'package:flutter/material.dart';

class HomeTaskPage extends StatefulWidget {
  const HomeTaskPage({super.key});

  @override
  State<HomeTaskPage> createState() => _HomeTaskPageState();
}

class _HomeTaskPageState extends State<HomeTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 181, 139, 248),
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.reply_all))
        ],
        title: const Text("App Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              final List<TaskCard>? items = snapshot.data;

              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('carregando')
                      ],
                    ),
                  );
                case ConnectionState.waiting:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('carregando')
                      ],
                    ),
                  );
                case ConnectionState.active:
                  return const Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('carregando')
                      ],
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final TaskCard tarefas = items[index];
                          return tarefas;
                        },
                      );
                    }
                    return const Center(
                      child: Text(
                        'lista vazia',
                        style: TextStyle(fontSize: 24),
                      ),
                    );
                  }
                  return const Center(
                    child: Text(
                      'banco de dados não encontrado',
                      style: TextStyle(fontSize: 24),
                    ),
                  );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .pushNamed("/addTask")
            .then((value) => setState(() {})),
        child: const Icon(Icons.add_task_sharp),
      ),
    );
  }
}
