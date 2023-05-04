import 'package:app_task_alura/data/task_inherited.dart';
import 'package:app_task_alura/screens/add/add_task.dart';
import 'package:app_task_alura/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskInherited(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          "/": (context) => const HomeTaskPage(),
          "/addTask": (context) => const AddPage(),
        },
      ),
    );
  }
}
