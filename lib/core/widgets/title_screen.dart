import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  final String title;
  const TitleScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    );
  }
}
