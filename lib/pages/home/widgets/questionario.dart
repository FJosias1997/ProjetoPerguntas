import 'package:flutter/material.dart';
import 'package:projeto_perguntas/pages/home/widgets/questao.dart';
import 'package:projeto_perguntas/pages/home/widgets/resposta.dart';

class QuestionarioPage extends StatefulWidget {
  final String pergunta;
  final List<int>? pontuacao;
  final List<String> respostas;
  final Function(int) onPressed;

  const QuestionarioPage(
      {required this.pergunta,
      this.pontuacao,
      required this.respostas,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  State<QuestionarioPage> createState() => _QuestionarioPageState();
}

class _QuestionarioPageState extends State<QuestionarioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Questao(questao: widget.pergunta),
            ListView.builder(
                itemCount: widget.respostas.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Resposta(
                    resposta: widget.respostas[index],
                    onPressed: () =>
                        widget.onPressed(widget.pontuacao![index]))),
          ],
        ),
      ),
    );
  }
}
