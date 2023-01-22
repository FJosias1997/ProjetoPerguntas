import 'package:flutter/material.dart';
import 'package:projeto_perguntas/pages/resultado/resultado.dart';
import 'package:projeto_perguntas/pages/home/widgets/questionario.dart';
import 'package:projeto_perguntas/pages/home/home_repository.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> perguntas = globals.listaPerguntas;
  int perguntaSelecionada = 0;
  int pontuacaoTotal = 0;
  List<String> resp = [];
  List<int> pontos = [];

  void _respostaPergunta(int pontos) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        pontuacaoTotal += pontos;
      });
    }
    debugPrint(pontuacaoTotal.toString());
  }

  void _resetQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    var listaObjeto = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
        : [];
    List<Map> listaMapa = temPerguntaSelecionada ? listaObjeto : [];
    if (temPerguntaSelecionada) {
      for (var element in listaMapa) {
        resp.add(element['texto']);
      }

      for (var element in listaMapa) {
        pontos.add(element['pontuacao']);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perguntas'),
      ),
      body: temPerguntaSelecionada
          ? QuestionarioPage(
              pergunta: perguntas[perguntaSelecionada]['pergunta'].toString(),
              pontuacao: pontos,
              respostas: resp,
              onPressed: (value) => _respostaPergunta(value),
            )
          : ResultadoPage(
              pontuacaoFinal: pontuacaoTotal,
              resetQuestionario: _resetQuestionario,
            ),
    );
  }
}
