import 'package:app_task_alura/data/task_dao.dart';
import 'package:flutter/material.dart';

class DialogDelete extends StatefulWidget {
  final String nome;
  const DialogDelete({
    super.key,
    required this.nome,
  });

  @override
  State<DialogDelete> createState() => _DialogDeleteState();
}

class _DialogDeleteState extends State<DialogDelete> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Excluir Tarefa'),
      content: Text('Deseja excluir a tarefa ${widget.nome}?'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Não')),
        TextButton(
            onPressed: () {
              TaskDao().delete(widget.nome);
              Navigator.pop(context);
              setState(() {});
            },
            child: const Text('Sim')),
      ],
    );
  }
}
