import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController newController;
  final String placeholder;

  const CustomTextField(
      {required this.label,
      required this.newController,
      required this.placeholder,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
        style: TextStyle(color: Color.fromARGB(255, 111, 111, 111)),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 250, 250),
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
            controller: newController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintText: placeholder,
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 136, 136, 136),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
