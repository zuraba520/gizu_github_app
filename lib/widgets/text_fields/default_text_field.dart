import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    required this.controller,
    required this.onChanged,
    this.hint,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final Function(String) onChanged;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(Icons.search),
      ],
    );
  }
}
