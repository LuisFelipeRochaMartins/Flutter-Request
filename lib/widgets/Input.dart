import 'package:flutter/material.dart';

class Input extends StatelessWidget {

  final Icon? icon;
  final String? placeholder;
  final dynamic border;
  final dynamic valorInicial;
  final bool   valida;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  Input({
    this.placeholder,
    this.icon,
    this.border,
    this.valorInicial,
    this.onChanged,
    required this.controller,
    required this.valida,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if ((value == null || value.isEmpty) && valida) {
            return 'Por favor preencha este campo';
          }
          return null;
        },
        decoration: InputDecoration(
          border: border,
          prefixIcon: icon,
          hintText: placeholder
        ),
        onChanged: onChanged,
      ),
    );
  }
}