import 'package:flutter/material.dart';

class ImagemTask extends StatelessWidget {
  final String url;
  const ImagemTask({required this.url, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 219, 194, 247),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: Offset(1, 1),
              spreadRadius: 1,
            ),
          ]),
      width: 95,
      height: 95,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder:
              (BuildContext context, Object exeption, StackTrace? stackTrace) {
            return const Icon(Icons.image_not_supported_sharp);
          },
        ),
      ),
    );
  }
}