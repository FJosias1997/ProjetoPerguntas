import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  final int pontuacaoFinal;
  final void Function() resetQuestionario;

  const ResultadoPage(
      {required this.pontuacaoFinal, required this.resetQuestionario, Key? key})
      : super(key: key);

  String get fraseResultado {
    if (pontuacaoFinal < 8) {
      return 'Parabéns!';
    } else if (pontuacaoFinal < 12) {
      return 'Você é Bom!';
    } else if (pontuacaoFinal < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              fraseResultado,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextButton(
              onPressed: resetQuestionario,
              child: const Text(
                'Reiniciar',
                style: TextStyle(
                  color: Colors.deepOrange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
