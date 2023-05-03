import 'package:flutter/material.dart';

class ProgressNivel extends StatefulWidget {
  final int dificuldade;
  final int nivel;
  const ProgressNivel({
    required this.dificuldade,
    required this.nivel,
    super.key,
  });

  @override
  State<ProgressNivel> createState() => _ProgressNivelState();
}

class _ProgressNivelState extends State<ProgressNivel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: LinearProgressIndicator(
        backgroundColor: const Color.fromARGB(199, 255, 255, 255),
        color: const Color.fromARGB(255, 101, 77, 139),
        value: (widget.dificuldade >= 0)
            ? (widget.nivel / widget.dificuldade) / 10
            : 1,
      ),
    );
  }
}
