import 'package:flutter/material.dart';

class DificuldadeTask extends StatelessWidget {
  final int dificuldade;
  const DificuldadeTask({required this.dificuldade, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: (dificuldade >= 1)
                ? const Color.fromARGB(255, 101, 77, 139)
                : const Color.fromARGB(199, 255, 255, 255),
          ),
          Icon(
            Icons.star,
            color: (dificuldade >= 2)
                ? const Color.fromARGB(255, 101, 77, 139)
                : const Color.fromARGB(199, 255, 255, 255),
          ),
          Icon(
            Icons.star,
            color: (dificuldade >= 3)
                ? const Color.fromARGB(255, 101, 77, 139)
                : const Color.fromARGB(199, 255, 255, 255),
          ),
          Icon(
            Icons.star,
            color: (dificuldade >= 4)
                ? const Color.fromARGB(255, 101, 77, 139)
                : const Color.fromARGB(199, 255, 255, 255),
          ),
          Icon(
            Icons.star,
            color: (dificuldade >= 5)
                ? const Color.fromARGB(255, 101, 77, 139)
                : const Color.fromARGB(199, 255, 255, 255),
          )
        ],
      ),
    );
  }
}
