import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final TextInputType keyboard;

  //final TextEditingController controller;

  const InputText(
      {required this.label,
      required this.keyboard,
      this.onChanged,
      this.validator,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      keyboardType: keyboard,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(115, 189, 108, 255),
        labelText: label,
        labelStyle: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromARGB(255, 153, 91, 253), width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
