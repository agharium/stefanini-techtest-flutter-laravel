import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MinimalTextInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPhone;

  const MinimalTextInput({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPhone = false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.phone ? [
          FilteringTextInputFormatter.digitsOnly,
          TelefoneInputFormatter(),
        ] : [],
        validator: (value) => value == null || value.isEmpty
          ? "Informe o ${label.toLowerCase()}"
            : keyboardType == TextInputType.emailAddress && (!value.contains('@') || !value.split('@').last.contains('.'))
              ? "E-mail inválido"
              : null
      ),
    );
  }
}
