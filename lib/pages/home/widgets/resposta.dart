import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final void Function() onPressed;

  const Resposta({required this.resposta, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        resposta,
        style: const TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
