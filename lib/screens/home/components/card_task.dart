// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_task_alura/shared/image_task.dart';
import 'package:app_task_alura/screens/home/components/star.dart';
import 'package:flutter/material.dart';
import 'progress_level.dart';

class TaskCard extends StatefulWidget {
  final String tarefa;
  final int dificuldade;
  final String urlImagem;

  TaskCard({
    Key? key,
    required this.tarefa,
    required this.dificuldade,
    required this.urlImagem,
  }) : super(key: key);
  int nivel = 0;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  void incrementar() {
    setState(() {
      widget.nivel++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 140,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 181, 139, 248),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: Offset(1, 1),
              spreadRadius: 1,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImagemTask(url: widget.urlImagem),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.tarefa),
                    DificuldadeTask(dificuldade: widget.dificuldade),
                    ProgressNivel(
                      dificuldade: widget.dificuldade,
                      nivel: widget.nivel,
                    ),
                    Text("nivel: ${widget.nivel}"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: incrementar,
                child: const Icon(Icons.arrow_drop_up_outlined),
              ),
            )
          ],
        ),
      ),
    );
  }
}
