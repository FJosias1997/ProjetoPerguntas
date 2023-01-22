import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String questao;

  const Questao({required this.questao, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          questao,
          style: const TextStyle(
            fontSize: 28,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
