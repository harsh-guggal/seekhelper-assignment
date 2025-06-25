import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  const DetailRow({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        Expanded(
          child: Text(" $value", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}
